import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/main-screens/login_screen.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/routes.dart';
import 'package:technozia/screens/admin-screens/home_screen.dart';
import 'package:technozia/screens/coreteam-screens/home_screen.dart';
import 'package:technozia/screens/participant-screens/home_screen.dart';
import 'package:technozia/services/auth_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    authServices.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technozia',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff03071e),
          elevation: 0,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          color: Colors.white,
        )),
        primaryColor: const Color(0xff03071e),
      ),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'core-team'
              ? const CoreTeamHome()
              : Provider.of<UserProvider>(context).user.type == 'participant'
                  ? const ParticipantHome()
                  : Provider.of<UserProvider>(context).user.type == 'admin'
                      ? const AdminHome()
                      : null
          : const LoginScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
