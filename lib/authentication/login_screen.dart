import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baseball_diary/authentication/widgets/auth_button.dart';
import 'package:baseball_diary/authentication/widgets/next_button.dart';
import 'package:baseball_diary/authentication/loginform_screen.dart';
import 'package:baseball_diary/authentication/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log in')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              FaIcon(FontAwesomeIcons.baseball, size: 50),
              SizedBox(height: 80),
              GestureDetector(
                onTap: () => _onEmailLoginTap(context),
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
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: NextButton(
              color: Colors.black,
              text: 'Sign up',
              onPressed: () => _onPressed(context),
            ),
          ),
        ),
      ),
    );
  }
}
