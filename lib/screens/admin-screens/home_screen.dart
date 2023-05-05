import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  static const String routeName = '/admin-screen';

  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Admin home screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
