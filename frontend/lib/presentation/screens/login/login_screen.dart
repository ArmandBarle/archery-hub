import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_session_jwt/flutter_session_jwt.dart';
import 'package:frontend/core/services/auth_service.dart';
import 'package:frontend/data/models/user_info_model.dart';
import 'package:frontend/data/repositories/secure_storage.dart';
import 'package:frontend/presentation/screens/home/home_feed_screen.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/presentation/screens/users/user_detail_screen.dart';
import 'package:frontend/core/constants/constants.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      var response = await _authService.login(email, password);
      if (response.statusCode == 200){

        // Get the payload
      var payload = await FlutterSessionJwt.getPayload();
      // Extract the userId and send it to the UserDetailScreen
      final userId = payload['sub'];
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => UserDetailScreen(user_id: userId)),
            MaterialPageRoute(builder: (context) => MainScreen()),
          );        
      }
    } catch (e) {
      // Handle login error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
