import 'package:flutter/material.dart';
import 'package:baseball_diary/authentication/widgets/next_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baseball_diary/authentication/select_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectScreen()),
    );
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                  '비밀번호를 입력하세요.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 40,
                  child: TextField(
                    controller: _passwordController,
                    autocorrect: false,
                    onEditingComplete: _onSubmit,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _onClearTap,
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: _toggleObscureText,
                            child: FaIcon(
                              _obscureText
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      hintText: 'Password',
                      errorText:
                          _isPasswordValid() ? null : '비밀번호 형식이 올바르지 않습니다.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.circleCheck,
                      color: _isPasswordValid() ? Colors.green : Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '비밀번호는 8자 이상이어야 합니다.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                NextButton(
                  color: _isPasswordValid() ? Colors.black : Colors.grey,
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
