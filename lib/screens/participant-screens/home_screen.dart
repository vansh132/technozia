import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/participant-screens/events_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:technozia/screens/participant-screens/team-profile/team_profile_screen.dart';

class ParticipantHome extends StatefulWidget {
  static const String routeName = '/participant-homescreen';
  const ParticipantHome({super.key});

  @override
  State<ParticipantHome> createState() => _ParticipantHomeState();
}

class _ParticipantHomeState extends State<ParticipantHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
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
