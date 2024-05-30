import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/core/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  bool success = await _authService.login(emailController.text, passwordController.text);

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User logged in successfully')),
                    );
                    // Navigate to home screen
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to log in user')),
                    );
                  }                  
                } catch (e) {
                  // Handle login error
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
