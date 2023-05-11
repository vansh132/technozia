import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/participant-screens/events_screen.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, EventScreen.routeName);
            },
            child: Text("Events"),
          ),
        ],
      ),
    );
  }

 
}
