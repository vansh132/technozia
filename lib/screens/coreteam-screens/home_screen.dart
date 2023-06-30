import 'package:flutter/material.dart';
import 'package:technozia/screens/admin-screens/posts/view_post_screen.dart';
import 'package:technozia/screens/admin-screens/registrations/view_registrations.dart';
import 'package:technozia/screens/coreteam-screens/original_core_home.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/view_volunteer_screen.dart';
import 'package:technozia/services/auth_services.dart';

class CoreTeamHome extends StatefulWidget {
  static const String routeName = '/core-team-screen';
  const CoreTeamHome({super.key});

  @override
  State<CoreTeamHome> createState() => _CoreTeamHomeState();
}

class _CoreTeamHomeState extends State<CoreTeamHome> {
  AuthServices authServices = AuthServices();

  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const OriginalCoreHome(),
    const ViewRegistrations(),
    const ViewPostScreen(),
    const ViewVolunteerListScreen(),
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
            icon: Icon(Icons.podcasts_rounded),
            label: 'Posts',
            backgroundColor: Color(0xff03071e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_rounded),
            label: 'Achievement',
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
