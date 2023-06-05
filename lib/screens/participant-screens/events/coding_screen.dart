import 'package:flutter/material.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/screens/participant-screens/registration/registration.dart';

class CodingScreen extends StatefulWidget {
  static const String routeName = '/coding-screen';
  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  Event event = Event(name: "Coding", price: 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 224,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                  color: Colors.red,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813560/events/icifzlplvqbyhuyvcokm.webp"))),
              // child: Image.network(
              //   "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683813560/events/icifzlplvqbyhuyvcokm.webp",
              // ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff03071e),
                    Color(0xff006064),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "\" Make it work, make it right, make it fast \"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Event Details",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Registration Fees',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                'Rs. 100/- Per Team',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'No. of Participants',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                'Two participants Per Team',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Rules",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Rule 1',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Rule 2',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Event Co - Ordinators",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Vansh',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                '9099897859',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Vansh',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                '9099897859',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Student Co - Ordinators",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Vansh',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                '9099897859',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Vansh',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                '9099897859',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Our Location",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Perform button action here
            },
            child: Text('Register Now'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
