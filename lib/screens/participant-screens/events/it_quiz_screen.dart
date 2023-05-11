import 'package:flutter/material.dart';

class ItQuizScreen extends StatefulWidget {
  static const String routeName = '/it-quiz-screen';
  const ItQuizScreen({super.key});

  @override
  State<ItQuizScreen> createState() => _ItQuizScreenState();
}

class _ItQuizScreenState extends State<ItQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "IT Quiz screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
