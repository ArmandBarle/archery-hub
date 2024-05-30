import 'package:flutter/material.dart';
import 'package:frontend/core/services/auth_service.dart';
import 'package:frontend/data/models/user_registration_model.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final AuthService _authService = AuthService();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () async {
                  User user = User(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    password: passwordController.text,
                  );  

                  bool success = await _authService.register(user);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User registered successfully')),
                    );
                    // Navigate to home screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to register user')),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
