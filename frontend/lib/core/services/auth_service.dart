import 'package:frontend/data/models/user_registration_model.dart';
import 'api_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/constants.dart';

class AuthService {
  // final ApiService apiService;
  static const String baseUrl = AppConstants.baseUrl;


  AuthService();

  Future<void> login(String email, String password) async {
    // final response = await apiService.postRequest('/login', {
    //   'email': email,
    //   'password': password,
    // });
    // // Handle login response
    // e.g., store token, handle errors, etc.
  }

  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      // You can add more detailed error handling here
      return false;
    }
  }
}
