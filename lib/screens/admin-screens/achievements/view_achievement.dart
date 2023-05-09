import 'package:flutter/material.dart';

class ViewAchievementScreen extends StatefulWidget {
  static const String routeName = "/view-achievement-screen";
  const ViewAchievementScreen({super.key});

  @override
  State<ViewAchievementScreen> createState() => _ViewAchievementScreenState();
}

class _ViewAchievementScreenState extends State<ViewAchievementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "view achievements",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
