import 'package:flutter/material.dart';
import 'package:technozia/services/auth_services.dart';

class MemberHomeScreen extends StatefulWidget {
  static const String routeName = '/member-screen';
  const MemberHomeScreen({super.key});

  @override
  State<MemberHomeScreen> createState() => _MemberHomeScreenState();
}

class _MemberHomeScreenState extends State<MemberHomeScreen> {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                authServices.logOut(context);
              },
              child: const Text("Log out"))
        ],
      ),
      body: const Center(
        child: Text(
          "Member screen yet to be developed",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
