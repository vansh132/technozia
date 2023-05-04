import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/main-screens/login_screen.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/routes.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const LoginScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
