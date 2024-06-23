import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/calendar/create_event_screen.dart';
import 'package:frontend/presentation/screens/calendar/event_list_screen.dart';
import 'package:frontend/presentation/screens/users/user_list_screen.dart';


class CoachScreen extends StatefulWidget {

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Coaches Corner',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateEventScreen()),
                );
              },
              child: const Text('Create Event'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsListScreen()),
                );
              },
              child: const Text('Events List'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create Notification'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersListScreen()),
                );
              },
              child: const Text('Club Members'),
            ),            
          ],
        ),
      ),
    );
  }
}