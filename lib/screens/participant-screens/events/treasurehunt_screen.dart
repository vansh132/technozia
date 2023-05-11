import 'package:flutter/material.dart';

class TreasureHuntScreen extends StatefulWidget {
  static const String routeName = '/treasure-hunt';
  const TreasureHuntScreen({super.key});

  @override
  State<TreasureHuntScreen> createState() => _TreasureHuntScreenState();
}

class _TreasureHuntScreenState extends State<TreasureHuntScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Treasure Hunt screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
