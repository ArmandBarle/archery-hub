import 'package:flutter/material.dart';
import 'package:frontend/core/services/user_service.dart';
import 'package:frontend/data/models/user_info_model.dart';

class EditUserDetailsScreen extends StatefulWidget {
  final UserDetail userDetail;

  EditUserDetailsScreen({required this.userDetail});

  @override
  _EditUserDetailsScreenState createState() => _EditUserDetailsScreenState();
}

class _EditUserDetailsScreenState extends State<EditUserDetailsScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController roleIdController;

  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.userDetail.firstName);
    lastNameController = TextEditingController(text: widget.userDetail.lastName);
    emailController = TextEditingController(text: widget.userDetail.email);
    phoneNumberController = TextEditingController(text: widget.userDetail.phoneNumber);
    roleIdController = TextEditingController(text: widget.userDetail.roleId);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    roleIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit User Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Telephone'),
            ),
            TextField(
              controller: roleIdController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                UserDetail updatedUser = UserDetail(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  phoneNumber: phoneNumberController.text,
                  roleId: int.parse(roleIdController.text ?? '0'), userId: null,
                );

                try {
                  UserDetail newUserDetail = await userService.updateUser(updatedUser);
                  Navigator.pop(context, newUserDetail);
                } catch (e) {
                  // Handle error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update user')),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
