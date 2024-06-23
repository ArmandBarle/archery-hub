import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/calendar/calendar_screen.dart';
import 'package:frontend/presentation/screens/chat_screen.dart';
import 'package:frontend/presentation/screens/home/main_screen.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/presentation/screens/login/login_screen.dart';
import 'package:frontend/presentation/screens/register/register_screen.dart';
import 'package:frontend/presentation/screens/splash/splash_screen.dart';
import 'package:frontend/presentation/screens/users/coach_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archery Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/main': (context) => MainScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/chat': (context) => ChatScreen(),
        '/calendar': (context) => CalendarScreen(),
        '/coach': (context) => CoachScreen(),
      },
    );
  }
}
