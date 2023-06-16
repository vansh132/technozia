import 'package:flutter/material.dart';
import 'package:technozia/services/auth_services.dart';

class CoreTeamHome extends StatefulWidget {
  static const String routeName = '/core-team-screen';
  const CoreTeamHome({super.key});

  @override
  State<CoreTeamHome> createState() => _CoreTeamHomeState();
}

class _CoreTeamHomeState extends State<CoreTeamHome> {
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
          "Core team home screen, yet to be build",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
