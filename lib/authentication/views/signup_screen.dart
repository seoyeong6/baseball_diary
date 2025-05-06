import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baseball_diary/authentication/widgets/auth_button.dart';
import 'package:baseball_diary/authentication/widgets/next_button.dart';
import 'package:baseball_diary/authentication/views/email_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  void _onPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onEmailScreenTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailScreen(username: "username"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Icon(Icons.sports_baseball_sharp, size: 50),
              SizedBox(height: 80),
              GestureDetector(
                onTap: () => _onEmailScreenTap(context),
                child: AuthButton(
                  text: 'E-mail & Password',
                  icon: FontAwesomeIcons.envelope,
                ),
              ),
              SizedBox(height: 20),
              AuthButton(
                text: 'Continue with Google',
                icon: FontAwesomeIcons.google,
              ),
              SizedBox(height: 20),
              AuthButton(
                text: 'Continue with Apple',
                icon: FontAwesomeIcons.apple,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: NextButton(
              color: Colors.black,
              text: '로그인 페이지로 돌아가기',
              onPressed: () => _onPressed(context),
            ),
          ),
        ),
      ),
    );
  }
}
