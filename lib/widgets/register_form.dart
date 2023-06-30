import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final VoidCallback onLoginClicked;
  final Function(String nim, String email, String password)
      onRegisterClicked; // Updated callback for register button
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterForm({
    Key? key,
    required this.onLoginClicked,
    required this.onRegisterClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0, // Set a fixed height for the form
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Center(
                  child: Text(
                    'Talk Parmad',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: nimController,
                decoration: InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onLoginClicked,
                    child: Text(
                      'Back to login',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Check if the passwords match
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        // If they match, call the callback function
                        onRegisterClicked(
                          nimController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      } else {
                        // If they don't match, show an alert dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Passwords do not match'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
