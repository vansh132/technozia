import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/screens/participant-screens/registration/registration.dart';
import 'package:url_launcher/url_launcher.dart';

class ItQuizScreen extends StatefulWidget {
  static const String routeName = '/it-quiz-screen';
  const ItQuizScreen({super.key});

  @override
  State<ItQuizScreen> createState() => _ItQuizScreenState();
}

class _ItQuizScreenState extends State<ItQuizScreen> {
  Event event = Event(name: "IT Quiz", price: 200);

  void _launchPhone(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: GlobalVariables.appBarColor,
        title: Text(
          event.name,
          style: TextStyle(
            color: GlobalVariables.appBarContentColor,
          ),
        ),
        centerTitle: true,
      ),
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683809174/events/nu6hspklthqq0jaejxsy.jpg",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
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
                    "You are never a loser until you quit trying",
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
                  Text(
                    "About Event",
                    style: TextStyle(
                      color: GlobalVariables.secondaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Registration Fees',
                                  style: TextStyle(
                                    color: GlobalVariables.richBlackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Rs. 200/- Per Team',
                                  style: TextStyle(
                                    color: GlobalVariables.richBlackColor,
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
                                  color: GlobalVariables.richBlackColor,
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
                                  color: GlobalVariables.richBlackColor,
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
                  Text(
                    "Event Guidelines",
                    style: TextStyle(
                      color: GlobalVariables.secondaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '- The participants are not allowed to use any third-party application (in searching for) answers, if found, will lead to disqualification.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: GlobalVariables.richBlackColor,
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
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- The result declared by the judge is final and will be taken in consideration.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: GlobalVariables.richBlackColor,
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
                  Text(
                    "Event Co - Ordinators",
                    style: TextStyle(
                      color: GlobalVariables.secondaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      const TableRow(children: [
                        TableCell(child: Text("")),
                        TableCell(
                            child: SizedBox(
                          width: 0,
                        )),
                      ]),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Abdullah',
                                style: TextStyle(
                                  color: GlobalVariables.richBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: GestureDetector(
                              onTap: () {
                                _launchPhone("+91 9606305138");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '+91 9606305138',
                                    style: TextStyle(
                                      color: GlobalVariables.richBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const TableRow(children: [
                        TableCell(child: Text("")),
                        TableCell(child: Text("")),
                      ]),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Sidra',
                                style: TextStyle(
                                  color: GlobalVariables.richBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: GestureDetector(
                              onTap: () {
                                _launchPhone("+91 702358429s");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '+91 7022358429',
                                    style: TextStyle(
                                      color: GlobalVariables.richBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
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
                  Text(
                    "Registration Guidelines",
                    style: TextStyle(
                      color: GlobalVariables.secondaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '- The registration for events can be done both online and offline. On the spot registrations are also available.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: GlobalVariables.richBlackColor,
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- The Registration fee for each event is Rs. 200/- per team except Treasure Hunt and Gaming which is Rs. 500/- per team.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: GlobalVariables.richBlackColor,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- There is no refund policy once registered or completed with the payment.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: GlobalVariables.richBlackColor,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- In case of any queries or registration related issues, please contact Event Co - Ordinators.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: GlobalVariables.richBlackColor,
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
            const SizedBox(
              height: 76,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                GlobalVariables.appBarColor,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RegistrationScreen.routeName,
                arguments: event,
              );
            },
            child: const Text('Register Now'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
