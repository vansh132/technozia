import 'package:flutter/material.dart';
import 'package:technozia/screens/admin-screens/achievements/add_achievements_screen.dart';
import 'package:technozia/screens/admin-screens/achievements/view_achievement.dart';
import 'package:technozia/screens/admin-screens/posts/add_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/view_post_screen.dart';

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
              onPressed: () {
                Navigator.pushNamed(context, AddPostScreen.routeName);
              },
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewAchievementScreen.routeName);
              },
              child: const Text(
                "View Achievements",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewPostScreen.routeName);
              },
              child: const Text(
                "View post",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
