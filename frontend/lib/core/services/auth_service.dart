import 'package:frontend/data/models/user_registration_model.dart';
import 'package:frontend/data/repositories/secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/constants.dart';
import 'package:logger/logger.dart';
import 'package:flutter_session_jwt/flutter_session_jwt.dart';

class AuthService {
  static const String baseUrl = AppConstants.baseUrl;
  final storage = SecureStorage();

  Future<String?> getToken() async {
    return await storage.read('auth_token');
  }

  Future<void> saveToken(String token) async {
    await storage.write('auth_token',token);
  }

  Future<void> deleteToken() async {
    await storage.delete('auth_token');
  }


  Future<bool> validateToken(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/validate_token'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body['valid'] == true;
    } else {
      return false;
    }
  }

  Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );  
    // Logger().i(response.body);  

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      var token = responseBody['auth_token'] as String;
      
      // saving token to secure storage
      await FlutterSessionJwt.saveToken(token);
      await storage.write('auth_token', token);

      return response;
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<bool> register(UserRegistration user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      // more detailed error handling here
      return false;
    }
  }

  Future<void> logout() async {
    
  }

}
