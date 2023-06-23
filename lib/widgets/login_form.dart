import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onRegisterClicked;

  const LoginForm({Key? key, required this.onRegisterClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0, // Adjust the height as needed
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
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onRegisterClicked,
                    child: Text(
                      '...or register here',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add login logic here
                    },
                    child: Text('Login'),
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
