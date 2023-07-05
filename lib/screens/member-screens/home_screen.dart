import 'package:flutter/material.dart';
import 'package:technozia/screens/admin-screens/achievements/participant_achievement.dart';
import 'package:technozia/screens/member-screens/member_proflie_screen.dart';
import 'package:technozia/screens/member-screens/original_member_home.dart';
import 'package:technozia/services/auth_services.dart';

class MemberHomeScreen extends StatefulWidget {
  static const String routeName = '/member-screen';
  const MemberHomeScreen({super.key});

  @override
  State<MemberHomeScreen> createState() => _MemberHomeScreenState();
}

class _MemberHomeScreenState extends State<MemberHomeScreen> {
  AuthServices authServices = AuthServices();

  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const OriginalMemberHome(),
    const ParticipantAchievementScreen(),
    const MemberProfileScreen(),
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
            icon: Icon(Icons.aod_rounded),
            label: 'Achievement',
            backgroundColor: Color(0xff03071e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_rounded),
            label: 'Profile',
            backgroundColor: Color(0xff03071e),
          ),
        ],
      ),
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
    );
  }
}
