import 'package:flutter/material.dart';
import 'package:technozia/screens/participant-screens/events/coding_screen.dart';
import 'package:technozia/screens/participant-screens/events/fast_typing.dart';
import 'package:technozia/screens/participant-screens/events/gaming_screen.dart';
import 'package:technozia/screens/participant-screens/events/it_manager_screen.dart';
import 'package:technozia/screens/participant-screens/events/it_quiz_screen.dart';
import 'package:technozia/screens/participant-screens/events/treasurehunt_screen.dart';
import 'package:technozia/screens/participant-screens/events/web_design_screen.dart';

class EventScreen extends StatefulWidget {
  static const String routeName = '/events-screen';
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  /* List<Event> eventList = [
    Event(
        name: "IT Quiz",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
    Event(
        name: "IT Manager",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
    Event(
        name: "Coding & Debugging",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
    Event(
        name: "Web Design",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
    Event(
        name: "Treasure Hunt",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
    Event(
        name: "Valorant",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
    Event(
        name: "Fast Typing",
        url:
            "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
        price: 100),
  ]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("OverAll Registration"),
            ),
            event(
              "IT Quiz",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
              ItQuizScreen.routeName,
            ),
            event(
              "IT Manager",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683812722/events/ags2hqbvf6xs6dbo6ty7.webp",
              ItManagerScreen.routeName,
            ),
            event(
              "Coding",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813560/events/icifzlplvqbyhuyvcokm.webp",
              CodingScreen.routeName,
            ),
            event(
              "Web Design",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813633/events/vuebsdqcuzbhvvfvncds.webp",
              WebDesignScreen.routeName,
            ),
            event(
              "Gaming",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813746/events/i8lojrttff6g74cmq0rc.jpg",
              GamingScreen.routeName,
            ),
            event(
              "Fast Typing",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813798/events/cyovm80a17vplxphrwpm.jpg",
              FastTyping.routeName,
            ),
            event(
              "Treasure Hunt",
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813865/events/iasdu1fe2judf4toqrux.jpg",
              TreasureHuntScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }

  Widget event(String name, String url, String routeName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  url,
                ),
              ),
            ),
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Icon(
                          Icons.arrow_right_alt_sharp,
                          color: Colors.white,
                          size: 36,
                          weight: 12,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
