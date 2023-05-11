import 'package:flutter/material.dart';

class GamingScreen extends StatefulWidget {
  static const String routeName = '/gaming-screen';
  const GamingScreen({super.key});

  @override
  State<GamingScreen> createState() => _GamingScreenState();
}

class _GamingScreenState extends State<GamingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Gaming screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
