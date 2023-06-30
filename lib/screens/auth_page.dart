import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/login_form.dart';
import 'package:talk_parmad/widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  final Function(String username, String password) loginUser;
  final Function(String nim, String email, String password) registerUser;

  const AuthPage({
    Key? key,
    required this.loginUser,
    required this.registerUser,
  }) : super(key: key);

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

  void _showSnackBar(String message, String status) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: status == 'success' ? Colors.green : Colors.red,
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
                      _showSnackBar('Wrong username or password!', 'error');
                    }
                  },
                )
              : RegisterForm(
                  onLoginClicked: _toggleForm,
                  onRegisterClicked: (nim, email, password) async {
                    bool success =
                        await widget.registerUser(nim, email, password);
                    if (!success) {
                      _showSnackBar('Failed to register!', 'error');
                    } else {
                      _showSnackBar('Registration successful!', 'success');
                      // wait 3 seconds before going back to login form
                      await Future.delayed(const Duration(seconds: 3));
                      _toggleForm();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
