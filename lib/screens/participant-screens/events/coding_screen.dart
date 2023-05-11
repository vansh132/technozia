import 'package:flutter/material.dart';

class CodingScreen extends StatefulWidget {
  static const String routeName = '/coding-screen';
  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813560/events/icifzlplvqbyhuyvcokm.webp",
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "\" Make it work, make it right, make it fast \"",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Register Now",
            ),
          )
        ],
      ),
    );
  }
}
