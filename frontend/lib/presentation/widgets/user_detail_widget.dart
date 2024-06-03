import 'package:flutter/material.dart';
import 'package:frontend/data/models/user_info_model.dart';

class UserDetailWidget extends StatelessWidget {
  final UserDetail user;

  const UserDetailWidget(BuildContext context, {super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          // You can customize the avatar based on user data, e.g., profile picture
          child: Text(user.firstName[0] + user.lastName[0]),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text(user.email),
        // You can add more widgets to display additional user information
      ),
    );
  }
}
