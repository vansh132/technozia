import 'package:flutter/material.dart';

class CodingScreen extends StatefulWidget {
  static const String routeName = '/coding-screen';
  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Coding screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
