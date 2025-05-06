import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/authentication/repos/auth_repo.dart';

/// 📦 이메일 + 비밀번호를 임시 저장할 form 상태
final signUpForm = StateProvider<Map<String, String>>((ref) => {});

/// 🧠 회원가입 로직을 담당하는 ViewModel 등록
final signUpViewModelProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);

/// 🧠 회원가입 ViewModel 본체
class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  /// ViewModel이 처음 만들어질 때 실행
  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  /// ✅ 회원가입 실행 함수
  Future<void> signUp() async {
    // 폼에서 이메일, 비밀번호 꺼내기
    final form = ref.read(signUpForm);
    final email = form['email'];
    final password = form['password'];

    // 값이 없으면 그냥 종료
    if (email == null || password == null) return;

    // 로딩 상태로 바꾸기
    state = const AsyncLoading();

    // Firebase에 요청하고, 성공/실패 결과로 상태 변경
    state = await AsyncValue.guard(() => _repository.signUp(email, password));
  }
}
