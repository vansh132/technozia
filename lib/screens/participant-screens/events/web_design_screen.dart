import 'package:flutter/material.dart';

class WebDesignScreen extends StatefulWidget {
  static const String routeName = '/web-design-screen';
  const WebDesignScreen({super.key});

  @override
  State<WebDesignScreen> createState() => _WebDesignScreenState();
}

class _WebDesignScreenState extends State<WebDesignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Web Design screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
