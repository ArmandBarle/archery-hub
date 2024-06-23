import 'package:flutter/material.dart';
import 'package:flutter_session_jwt/flutter_session_jwt.dart';
import 'package:frontend/data/models/results_model.dart';
import 'package:frontend/data/repositories/secure_storage.dart';
import 'package:frontend/presentation/screens/calendar/calendar_screen.dart';
import 'package:frontend/presentation/screens/chat/chat_screen.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/presentation/screens/results/results_screen.dart';
import 'package:frontend/presentation/screens/users/coach_screen.dart';
import 'package:frontend/presentation/screens/users/user_detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final storage = SecureStorage();

  Future<void> _logout() async {
    await storage.delete('auth_token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<int?> _getUserId() async {
    var payload = await FlutterSessionJwt.getPayload();
      final userId = payload['sub'];
      return userId;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hub'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<int?>(
        future: _getUserId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching user ID,$snapshot.error'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user ID found'));
          }

          int userId = snapshot.data! as int;

          List<Widget> _widgetOptions = <Widget>[
            HomeFeedScreen(),
            UserDetailScreen(user_id: userId),
            ChatScreen(),
            ResultsScreen(),
            CalendarScreen(),
            CoachScreen(),
          ];

          return _widgetOptions.elementAt(_selectedIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Coaches',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 42, 35, 143),
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Home feed',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Upcoming events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Text(
              'News and Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
