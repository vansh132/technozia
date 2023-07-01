import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/screens/participant-screens/registration/single_registration.dart';
import 'package:url_launcher/url_launcher.dart';

class ItManagerScreen extends StatefulWidget {
  static const String routeName = '/it-manager-screen';
  const ItManagerScreen({super.key});

  @override
  State<ItManagerScreen> createState() => _ItManagerScreenState();
}

class _ItManagerScreenState extends State<ItManagerScreen> {
  Event event = Event(name: "IT Manager", price: 200);

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
      appBar: AppBar(
        title: Text(event.name),
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
                    "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1683812722/events/ags2hqbvf6xs6dbo6ty7.webp",
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
                    "The best way to predict the future is to invent it",
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
                  const Text(
                    "About Event",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Rs. 200/- Per Team',
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
                                'Individual',
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
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '- 1st round will consist of English comprehension, aptitude, and the basics of computers.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- Panel discussion topic will be informed on the day of the event.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- Any sort of misbehaviour will lead to disqualification.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- The participants are not allowed to use any third-party application (in searching for) answers, if found, will lead to disqualification.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
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
                      color: Color(0xffFFFFFF),
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
                          const TableCell(
                            child: Center(
                              child: Text(
                                'Ritika',
                                style: TextStyle(
                                  color: Colors.black,
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
                                _launchPhone("+91 9900453406");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '+91 9900453406',
                                    style: TextStyle(
                                      color: Colors.black,
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
                          const TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Nitya',
                                style: TextStyle(
                                  color: Colors.black,
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
                                _launchPhone("+91 9148868708");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '+91 9148868708',
                                    style: TextStyle(
                                      color: Colors.black,
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
                  const Text(
                    "Registration Guidelines",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 6,
                    thickness: 2,
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '- The registration for events can be done both online and offline. On the spot registrations are also available.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- The Registration fee for each event is Rs. 200/- per team except Treasure Hunt and Gaming which is Rs. 500/- per team.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- There is no refund policy once registered or completed with the payment.',
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
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '- In case of any queries or registration related issues, please contact Event Co - Ordinators.',
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
                SingleRegistrationScreen.routeName,
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
