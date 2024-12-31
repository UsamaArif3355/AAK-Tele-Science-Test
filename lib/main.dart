import 'package:companiestest/features/auth/screens/signup_screen.dart';
import 'package:companiestest/features/auth/screens/user_type_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      initialRoute: '/userType',
      routes: {
        '/userType': (context) => UserTypeScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
