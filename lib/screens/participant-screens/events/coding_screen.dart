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
                /* gradient: const LinearGradient(
                  colors: [
                    Color(0xff03071e),
                    Color(0xff006064),
                  ],
                  tileMode: TileMode.clamp,
                ), */
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xff03071e),
                        Color(0xff006064),
                      ],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "Make it work, Make it right, Make it fast",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),
              ),
            ),
            /* const SizedBox(
              height: 8,
            ), */
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "About Event",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  'Registration Fees',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  'Rs. 100/- Per Team',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                'Two Per Team',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Event Guidelines",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Text(
                                '- The participants are required to have a working HackerRank account before registering for the event.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '- The mail used for HackerRank and registering for the event must be the same to avoid any ambiguity.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '- The participants are not allowed to use any third-party application in searching for answers, if found, will lead to disqualification.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '- The result declared by the judge is final and will be taken in consideration.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
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
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
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
            child: const Text('Register Now'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
