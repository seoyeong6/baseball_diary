import 'package:flutter/material.dart';
import 'package:baseball_diary/authentication/widgets/textfield_widget.dart';
import 'package:baseball_diary/authentication/widgets/next_button.dart';
import 'package:baseball_diary/authentication/password_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = '';

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordScreen()),
    );
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!regExp.hasMatch(_email)) {
      return "이메일 형식이 올바르지 않습니다";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        appBar: AppBar(title: Text('Sign up')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '이메일을 입력하세요.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmit,
                  hintText: 'E-mail',
                  errorText: _isEmailValid(),
                ),
                SizedBox(height: 40),
                NextButton(
                  color:
                      _email.isNotEmpty && _isEmailValid() == null
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                  text: 'Next',
                  onPressed: () => _onSubmit(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
