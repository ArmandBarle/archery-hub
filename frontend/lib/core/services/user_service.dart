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
    final token = await SecureStorage().read("auth_token");
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

  Future<UserDetail> updateUser(UserDetail userDetail) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${userDetail.userId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstName': userDetail.firstName,
        'lastName': userDetail.lastName,
        'email': userDetail.email,
        'phoneNumber': userDetail.phoneNumber,
        'roleId': userDetail.roleId.toString(),
      }),
    );

    if (response.statusCode == 200) {
      return UserDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }
}
