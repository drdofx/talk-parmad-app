// import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talk_parmad/services/auth_service.dart';

class AuthController {
  final AuthService authService;
  final SharedPreferences sharedPreferences;

  AuthController({
    required this.authService,
    required this.sharedPreferences,
  });

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String username, String password) async {
    try {
      final response = await authService.login(username, password);

      // Extract the JWT token from the response
      final token = response['data'];

      // Store the token in shared preferences
      await sharedPreferences.setString('jwtToken', token);

      _isLoggedIn = true;

      return true; // Login successful
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
      return false;
    }
  }

  Future<void> logout() async {
    // Clear the stored JWT token from shared preferences
    await sharedPreferences.remove('jwtToken');
    _isLoggedIn = false;
  }
}
