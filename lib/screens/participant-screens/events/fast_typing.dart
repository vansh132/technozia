import 'package:flutter/material.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/screens/participant-screens/registration/registration.dart';

class FastTyping extends StatefulWidget {
  static const String routeName = '/fast-typing-screen';
  const FastTyping({super.key});

  @override
  State<FastTyping> createState() => _FastTypingState();
}

class _FastTypingState extends State<FastTyping> {
  Event event = Event(name: "Fast Typing", price: 150);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813560/events/icifzlplvqbyhuyvcokm.webp",
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "\" Make it work, make it right, make it fast \"",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Rs. 100",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RegistrationScreen.routeName,
                arguments: event,
              );
            },
            child: const Text(
              "Register Now",
            ),
          ),
        ],
      ),
    );
  }
}
