import 'package:flutter/material.dart';
import 'package:technozia/main-screens/signup_screen.dart';
import 'package:technozia/screens/admin-screens/achievements/add_achievements_screen.dart';
import 'package:technozia/screens/admin-screens/achievements/view_achievement.dart';
import 'package:technozia/screens/admin-screens/home_screen.dart';
import 'package:technozia/screens/admin-screens/posts/add_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/view_post_screen.dart';
import 'package:technozia/screens/admin-screens/users/view_users_screen.dart';
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
    case ViewAchievementScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewAchievementScreen(),
      );
    case AddPostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddPostScreen(),
      );
    case ViewPostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewPostScreen(),
      );
    case ViewUserScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewUserScreen(),
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
