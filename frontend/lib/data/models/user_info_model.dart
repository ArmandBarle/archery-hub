
import 'package:flutter/material.dart';

class UserDetail extends ChangeNotifier{
  final int userId;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final int roleId;
  // final DateTime userCreatedAt;
  // final DateTime userUpdatedAt;

  UserDetail({
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    // required this.userCreatedAt,
    // required this.userUpdatedAt,
  });

  factory UserDetail.fromJson(dynamic json) {
    return UserDetail(
      userId: json['user_id'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      roleId: json['role_id'],
      // userCreatedAt: DateTime.parse(json['user_created_at']),
      // userUpdatedAt: DateTime.parse(json['user_updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'role_id': roleId,
      // 'user_created_at': userCreatedAt.toIso8601String(),
      // 'user_updated_at': userUpdatedAt.toIso8601String(),
    };
  }
}
