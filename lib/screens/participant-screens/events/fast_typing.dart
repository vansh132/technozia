import 'package:flutter/material.dart';

class FastTyping extends StatefulWidget {
  static const String routeName = '/fast-typing-screen';
  const FastTyping({super.key});

  @override
  State<FastTyping> createState() => _FastTypingState();
}

class _FastTypingState extends State<FastTyping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Fast Typing screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
