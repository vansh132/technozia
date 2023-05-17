import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  static const String routeName = "/user-profile-screen";
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _LeaderProfileState();
}

class _LeaderProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("data"),
    );
  }
}
