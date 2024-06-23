import 'package:flutter/material.dart';
import 'package:frontend/core/services/equipment_set_service.dart';
import 'package:frontend/core/services/result_service.dart';
import 'package:frontend/core/services/user_service.dart';
import 'package:frontend/core/services/event_service.dart';
import 'package:frontend/data/models/equipment_set_model.dart';
import 'package:frontend/data/models/results_model.dart';
import 'package:frontend/data/models/user_info_model.dart';
import 'package:frontend/data/models/event_model.dart';
import 'package:frontend/presentation/screens/equipment/add_equipment_set_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final int user_id;
  UserDetailScreen({required this.user_id});
  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late Future<UserDetail> _futureUser;
  late Future<List<EquipmentSet>> _futureEquipment;
  late Future<List<Result>> _futureResults;

  @override
  void initState() {
    super.initState();
    _futureUser = UserService().getUserbyId(widget.user_id);
    _futureEquipment = EquipmentService().getUserEquipment(widget.user_id);
    _futureResults = ResultService().getResultsById(widget.user_id);
  }

  void _navigateToAddEquipment() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEquipmentScreen(userId: widget.user_id)),
    );

    if (result == true) {
      // Refresh equipment list
      setState(() {
        _futureEquipment = EquipmentService().getUserEquipment(widget.user_id);
      });
    }
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Profile Picture and Name
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundColor: Colors.grey[300],
                                    child: Icon(Icons.person, size: 40.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '${userDetail.firstName} ${userDetail.lastName}',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.0),
                              // User Information
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Email
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
                                    // Telephone
                                    Text(
                                      'Telephone',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0
                                        ),
                                      ),                                    
                                    Text(
                                      '${userDetail.phoneNumber}',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(height: 8.0),
                                    // Role
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
                                  ],
                                ),
                              ),
                              // Edit Button
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     ElevatedButton(
                              //       onPressed: () {
                              //         // Implement edit user details functionality
                              //       },
                              //       style: ElevatedButton.styleFrom(
                              //         backgroundColor: Colors.blue,
                              //         padding: EdgeInsets.symmetric(horizontal: 32.0),
                              //       ),
                              //       child: Text(
                              //         'Edit',
                              //         style: TextStyle(color: Colors.white),
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
                              FutureBuilder<List<EquipmentSet>>(
                                future: _futureEquipment,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    final equipmentList = snapshot.data!;
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: equipmentList.length,
                                      itemBuilder: (context, index) {
                                        final equipment = equipmentList[index];
                                        return ListTile(
                                          title: Text(equipment.equipmentSetName),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: _navigateToAddEquipment,
                                child: Text('Add Equipment'),
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
                              FutureBuilder<List<Result>>(
                                future: _futureResults,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    final results = snapshot.data!;
                                    if (results.isEmpty) {
                                      return Text('No results available.');
                                    } else {
                                      final highestResult = results.reduce((a, b) => (a.resultTotal ?? 0) > (b.resultTotal ?? 0) ? a : b);
                                      final highestScore = highestResult.resultTotal ?? 0;
                                      return FutureBuilder<Event>(
                                        future: EventService().getEventById(highestResult.eventId!),
                                        builder: (context, eventSnapshot) {
                                          if (eventSnapshot.connectionState == ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (eventSnapshot.hasError) {
                                            return Text('Error: ${eventSnapshot.error}');
                                          } else {
                                            final event = eventSnapshot.data!;
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ListTile(
                                                  title: Text('Highest Score: $highestScore'),
                                                ),
                                                ListTile(
                                                  title: Text('Event: ${event.eventName}'),
                                                  subtitle: Text('Location: ${event.eventLocation}'),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      );
                                    }
                                  }
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
