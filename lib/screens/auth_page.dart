import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/login_form.dart';
import 'package:talk_parmad/widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  final Function(String username, String password) loginUser;

  const AuthPage({Key? key, required this.loginUser}) : super(key: key);

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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
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
                  onLoginClicked: (username, password) async {
                    bool success = await widget.loginUser(username, password);
                    if (!success) {
                      _showSnackBar('Wrong username or password!');
                    }
                  },
                )
              : RegisterForm(
                  onLoginClicked: _toggleForm,
                ),
        ),
      ),
    );
  }
}
