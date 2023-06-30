import 'package:flutter/material.dart';
import 'package:technozia/main-screens/login_screen.dart';
import 'package:technozia/main-screens/signup_screen.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/models/post.dart';
import 'package:technozia/models/volunteer.dart';
import 'package:technozia/screens/admin-screens/achievements/add_achievements_screen.dart';
import 'package:technozia/screens/admin-screens/achievements/participant_achievement.dart';
import 'package:technozia/screens/admin-screens/achievements/view_achievement.dart';
import 'package:technozia/screens/admin-screens/achievements/view_update_achievement.dart';
import 'package:technozia/screens/admin-screens/home_screen.dart';
import 'package:technozia/screens/admin-screens/posts/add_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/edit_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/view_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/view_update_post.dart';
import 'package:technozia/screens/admin-screens/registrations/view_registrations.dart';
import 'package:technozia/screens/admin-screens/users/modify_user_role_screen.dart';
import 'package:technozia/screens/admin-screens/users/view_users_screen.dart';
import 'package:technozia/screens/coreteam-screens/home_screen.dart';
import 'package:technozia/screens/coreteam-screens/original_core_home.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/add_volunteer_screen.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/edit_delete_volunteer_screen.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/view_volunteer_screen.dart';
import 'package:technozia/screens/member-screens/home_screen.dart';
import 'package:technozia/screens/member-screens/member_proflie_screen.dart';
import 'package:technozia/screens/member-screens/original_member_home.dart';
import 'package:technozia/screens/participant-screens/events/coding_screen.dart';
import 'package:technozia/screens/participant-screens/events/fast_typing.dart';
import 'package:technozia/screens/participant-screens/events/gaming_screen.dart';
import 'package:technozia/screens/participant-screens/events/it_manager_screen.dart';
import 'package:technozia/screens/participant-screens/events/it_quiz_screen.dart';
import 'package:technozia/screens/participant-screens/events/treasurehunt_screen.dart';
import 'package:technozia/screens/participant-screens/events/web_design_screen.dart';
import 'package:technozia/screens/participant-screens/events_screen.dart';
import 'package:technozia/screens/participant-screens/home_screen.dart';
import 'package:technozia/screens/participant-screens/original_home.dart';
import 'package:technozia/screens/participant-screens/profile/user_profile.dart';
import 'package:technozia/screens/participant-screens/registration/five_registration.dart';
import 'package:technozia/screens/participant-screens/registration/registration.dart';
import 'package:technozia/screens/participant-screens/registration/single_registration.dart';
import 'package:technozia/screens/participant-screens/registration/view_registration.dart';
import 'package:technozia/screens/participant-screens/team-profile/team_profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
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
    case MemberHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MemberHomeScreen(),
      );
    case MemberProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MemberProfileScreen(),
      );
    case OriginalMemberHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OriginalMemberHome(),
      );
    case OriginalHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OriginalHomeScreen(),
      );
    case CoreTeamHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CoreTeamHome(),
      );
    case AddVolunteerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddVolunteerScreen(),
      );
    case EditDeleteVolunteerScreen.routeName:
      var volunteer = routeSettings.arguments as Volunteer;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EditDeleteVolunteerScreen(
          volunteer: volunteer,
        ),
      );
    case ViewVolunteerListScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewVolunteerListScreen(),
      );
    case OriginalCoreHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OriginalCoreHome(),
      );
    case AdminHome.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminHome(),
      );
    case ModifyUserRoleScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ModifyUserRoleScreen(),
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
    case ParticipantAchievementScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ParticipantAchievementScreen(),
      );
    case ViewUpdateAchievementScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewUpdateAchievementScreen(),
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
    case EditPostScreen.routeName:
      var post = routeSettings.arguments as Post;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EditPostScreen(
          post: post,
        ),
      );
    case ViewEditPostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewEditPostScreen(),
      );
    case ViewUserScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewUserScreen(),
      );
    case ViewRegistrations.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewRegistrations(),
      );
    case EventScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EventScreen(),
      );
    case ItQuizScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ItQuizScreen(),
      );
    case ItManagerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ItManagerScreen(),
      );
    case CodingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CodingScreen(),
      );
    case WebDesignScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WebDesignScreen(),
      );
    case GamingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GamingScreen(),
      );
    case FastTyping.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FastTyping(),
      );
    case TreasureHuntScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TreasureHuntScreen(),
      );
    case TeamProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TeamProfileScreen(),
      );
    case RegistrationScreen.routeName:
      var event = routeSettings.arguments as Event;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegistrationScreen(
          event: event,
        ),
      );
    case SingleRegistrationScreen.routeName:
      var event = routeSettings.arguments as Event;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SingleRegistrationScreen(
          event: event,
        ),
      );
    case FiveRegistrationScreen.routeName:
      var event = routeSettings.arguments as Event;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FiveRegistrationScreen(
          event: event,
        ),
      );
    case ViewRegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewRegisterScreen(),
      );
    case UserProfile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserProfile(),
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
