import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/main-screens/login_screen.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/participant-screens/events_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:technozia/screens/participant-screens/profile/user_profile.dart';
import 'package:technozia/screens/participant-screens/registration/view_registration.dart';
import 'package:technozia/screens/participant-screens/team-profile/team_profile_screen.dart';
import 'package:technozia/services/auth_services.dart';

class ParticipantHome extends StatefulWidget {
  static const String routeName = '/participant-homescreen';
  const ParticipantHome({super.key});

  @override
  State<ParticipantHome> createState() => _ParticipantHomeState();
}

class _ParticipantHomeState extends State<ParticipantHome> {
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                authServices.logOut(context);
              },
              child: Text("Log out"))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, EventScreen.routeName);
              },
              child: Text("Events"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, TeamProfileScreen.routeName);
              },
              child: Text("Team - Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewRegisterScreen.routeName);
              },
              child: Text("Registrations"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, UserProfile.routeName);
              },
              child: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // DateTime.now().hour.toInt() > 18
            // ? Text("Good Morning")
            Text("Good Morning"),
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813633/events/vuebsdqcuzbhvvfvncds.webp",
              ),
            )
          ],
        ),
      ),
    );
  }
}
