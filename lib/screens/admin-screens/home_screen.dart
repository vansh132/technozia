import 'package:flutter/material.dart';
import 'package:technozia/screens/admin-screens/add_achievements_screen.dart';

class AdminHome extends StatelessWidget {
  static const String routeName = '/admin-screen';

  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddAchievementScreen.routeName);
              },
              child: const Text(
                "Add Achievement",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Add post",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Call meeting",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Registration Status",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
