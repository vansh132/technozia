import 'package:flutter/material.dart';

class CoreTeamHome extends StatelessWidget {
  static const String routeName = '/core-team-screen';
  const CoreTeamHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Core team home screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
