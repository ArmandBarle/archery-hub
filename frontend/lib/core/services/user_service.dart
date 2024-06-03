import 'dart:convert';
import 'package:frontend/data/repositories/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/constants.dart';
import 'package:frontend/data/models/user_info_model.dart';

class UserService {
  final String baseUrl = AppConstants.baseUrl;

  Future<List<UserDetail>> getAllUsers() async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((json) => UserDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserDetail> getUserbyId(int user_id) async {
    final url = Uri.parse('$baseUrl/users/$user_id');
    final token = await SecureStorage().read("jwt");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'}, 
    );

    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return UserDetail.fromJson(userJson);
    } else {
      throw Exception('Failed to get user');
    }
  }
}
