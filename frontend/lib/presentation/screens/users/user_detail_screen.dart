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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                        // Profile Section
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Profile Picture
                              Center(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.grey[300],
                                  child: Icon(Icons.person, size: 40.0),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              // User Information
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '${userDetail.firstName} ${userDetail.lastName}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '${userDetail.email}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Telephone',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '${userDetail.phoneNumber}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Role',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '${userDetail.roleId}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // SizedBox(height: 8.0),
                              // Text(
                              //   'Joined since',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 16.0,
                              //   ),
                              // ),
                              // Text(
                              //   '${userDetail.joinedAt}', // Assuming joinedAt is available
                              //   style: TextStyle(fontSize: 16.0),
                              // ),
                              SizedBox(height: 16.0),
                              // Edit Button
                              ElevatedButton(
                                onPressed: () {
                                  // Implement edit user details functionality
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                                ),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // Equipment Section
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Equipment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              // Add list of equipment here
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3, // Replace with actual equipment count
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Equipment Item ${index + 1}'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // Statistics Section
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Statistics',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              // Add list of statistics here
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4, // Replace with actual statistics count
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Statistic ${index + 1}'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),                      
                      ],
                    );
                }
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}