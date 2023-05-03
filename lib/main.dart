import 'package:flutter/material.dart';
import 'package:technozia/main-screens/home_screen.dart';
import 'package:technozia/main-screens/login_screen.dart';
import 'package:technozia/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technozia',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff03071e),
          elevation: 0,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          color: Colors.white,
        )),
        primaryColor: const Color(0xff03071e),
      ),
      home: const LoginScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
