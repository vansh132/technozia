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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcce3de),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Events",
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                // color: Colors.red,
                child: const Text(
                  "\" Register for Our Events Today \"",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff03071e),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(
                color: Color(0xff03071e),
              ),
              // OutlinedButton(
              //   clipBehavior: Clip.hardEdge,
              //   onPressed: () {},
              //   child: const Text(
              //     "OverAll Registration",
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              
              const SizedBox(
                height: 16,
              ),
              
              const SizedBox(
                height: 16,
              ),
              
              const SizedBox(
                height: 16,
              ),
              
              const SizedBox(
                height: 16,
              ),
              
              const SizedBox(
                height: 16,
              ),
              
              const SizedBox(
                height: 16,
              ),
              
            ],
          ),
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
                        Expanded(
                          child: Center(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 16,
                        // ),
                        // const Icon(
                        //   Icons.arrow_right_alt_sharp,
                        //   color: Colors.white,
                        //   size: 36,
                        //   weight: 12,
                        // ),
                        // const SizedBox(
                        //   width: 16,
                        // ),
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
