import 'package:flutter/material.dart';
import 'package:technozia/screens/participant-screens/original_home.dart';
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

  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const OriginalHomeScreen(),
    const ViewRegisterScreen(),
    const TeamProfileScreen(),
    const UserProfile(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        iconSize: 24,
        enableFeedback: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff03071e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            tooltip: "Registrations",
            backgroundColor: Color(0xff03071e),
            label: 'Registrations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Team Members',
            backgroundColor: Color(0xff03071e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xff03071e),
          ),
        ],
      ),
      body: SafeArea(
        /* child: Column(
          children: [
            // topBar(),
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
          ], */
        child: _screens[_selectedIndex],
      ),
    );
  }

  Widget topBar() {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
