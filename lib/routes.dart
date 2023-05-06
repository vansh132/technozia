import 'package:flutter/material.dart';
import 'package:technozia/main-screens/signup_screen.dart';
import 'package:technozia/screens/admin-screens/add_achievements_screen.dart';
import 'package:technozia/screens/admin-screens/home_screen.dart';
import 'package:technozia/screens/coreteam-screens/home_screen.dart';
import 'package:technozia/screens/participant-screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignupScreen(),
      );
    case ParticipantHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ParticipantHome(),
      );
    case CoreTeamHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CoreTeamHome(),
      );
    case AdminHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminHome(),
      );
    case AddAchievementScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddAchievementScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
