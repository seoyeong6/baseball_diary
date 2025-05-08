import 'package:flutter/material.dart';
import 'package:baseball_diary/authentication/widgets/next_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/route_const.dart';

class LoginFormScreen extends ConsumerStatefulWidget {
  const LoginFormScreen({super.key});

  @override
  ConsumerState<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends ConsumerState<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final email = formData['email'];
      final password = formData['password'];

      if (email == null || password == null) return;

      try {
        // ✅ Firebase 로그인 실행
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (context.mounted) {
          final prefs = await SharedPreferences.getInstance();
          final hasTeam = prefs.getBool('hasSelectedTeam') ?? false;

          if (context.mounted) {
            context.go(hasTeam ? mainNavigationRoute : selectRoute);
          }
        }
      } on FirebaseAuthException catch (e) {
        // ❗ 로그인 실패 시 에러 처리
        String message = '로그인에 실패했습니다.';
        if (e.code == 'user-not-found') {
          message = '존재하지 않는 이메일입니다.';
        } else if (e.code == 'wrong-password') {
          message = '비밀번호가 틀렸습니다.';
        }

        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('로그인 실패'),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('확인'),
                  ),
                ],
              ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('로그인', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 24.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '이메일',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      //TODO: 이메일 형식 검사 및 데이터 저장 시 검증
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your email";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['email'] = newValue;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your password";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['password'] = newValue;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 28),
                  NextButton(
                    color: Theme.of(context).primaryColor,
                    text: '로그인',
                    onPressed: () => _onSubmit(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
