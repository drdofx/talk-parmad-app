import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/login_form.dart';
import 'package:talk_parmad/widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showLoginForm = true;

  void _toggleForm() {
    setState(() {
      _showLoginForm = !_showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _showLoginForm
              ? LoginForm(
                  onRegisterClicked: _toggleForm,
                )
              : RegisterForm(
                  onLoginClicked: _toggleForm,
                ),
        ),
      ),
    );
  }
}
