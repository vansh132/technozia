import 'package:flutter/material.dart';

class ItManagerScreen extends StatefulWidget {
  static const String routeName = '/it-manager-screen';
  const ItManagerScreen({super.key});

  @override
  State<ItManagerScreen> createState() => _ItManagerScreenState();
}

class _ItManagerScreenState extends State<ItManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "IT manager screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
