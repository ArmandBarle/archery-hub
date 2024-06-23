import 'package:flutter/material.dart';
import 'package:frontend/core/services/user_service.dart';
import 'package:frontend/data/models/user_info_model.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UsersListScreen> {
  late Future<List<UserDetail>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = UserService().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<UserDetail>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(child: Text('Failed to load users'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await UserService().deleteUser(user.userId);
                      setState(() {
                        _futureUsers = UserService().getAllUsers();
                      });
                    },
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}