import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/login/login_screen.dart';
import 'package:frontend/presentation/screens/register/register_screen.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/presentation/screens/arrows/add_arrow_screen.dart';
import 'package:frontend/presentation/screens/arrows/arrow_list_screen.dart';
import 'package:frontend/presentation/screens/bows/add_bow_screen.dart';
import 'package:frontend/presentation/screens/bows/bow_list_screen.dart';
import 'package:frontend/presentation/screens/users/user_list_screen.dart';


class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const HomeScreen(),
      '/login': (context) => LoginScreen(),      
      '/users-list':(context) => const UsersListScreen(),
      '/register': (context) => RegisterScreen(),
      '/add-arrow': (context) => AddArrowScreen(),
      '/arrow-list': (context) => ArrowListScreen(),
      '/add-bow': (context) => AddBowScreen(),
      '/bow-list': (context) => BowListScreen(),
    };
  }
}
