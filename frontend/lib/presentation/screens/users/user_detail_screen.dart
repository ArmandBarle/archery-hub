import 'package:flutter/material.dart';
import 'package:frontend/core/services/auth_service.dart';
import 'package:frontend/core/services/user_service.dart';
import 'package:frontend/data/models/user_info_model.dart';

class UserDetailScreen extends StatefulWidget {
  final int user_id;
  UserDetailScreen({required this.user_id});
  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  
  late Future<UserDetail> _futureUser;
  

   @override
  void initState() {
    super.initState();
    _futureUser = UserService().getUserbyId(widget.user_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<UserDetail>(
              future: _futureUser,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final userDetail = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${userDetail.firstName} ${userDetail.lastName}', style: const TextStyle(fontSize: 18)),
                      Text('Email: ${userDetail.email}', style: TextStyle(fontSize: 18)),
                      Text('Phone: ${userDetail.phoneNumber}', style: TextStyle(fontSize: 18)),
                      Text('Role ID: ${userDetail.roleId}', style: TextStyle(fontSize: 18)),
                      Text('User ID: ${userDetail.userId}', style: TextStyle(fontSize: 18)),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logout logic here
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
