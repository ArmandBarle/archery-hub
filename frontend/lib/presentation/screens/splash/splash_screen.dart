import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/core/services/auth_service.dart';
import 'package:frontend/presentation/screens/home/main_screen.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 4), () {
      // need to run the check token function however async fucntions cant be run in initstate so need to find a fix for that
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays:SystemUiOverlay.values);
  }

  Future<void> _checkToken() async {
    String? token = _authService.getToken() as String?;

    if (token != null) {
      bool isValid = await _authService.validateToken(token);
      if (isValid) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        return;
      }
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[300], // Replace with your logo
              child: Center(child: Text('LOGO')),
            ),
            SizedBox(height: 20),
            Text(
              'Archery Hub',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
