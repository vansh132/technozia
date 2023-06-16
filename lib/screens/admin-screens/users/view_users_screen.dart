import 'package:flutter/material.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/services/auth_services.dart';

class ViewUserScreen extends StatefulWidget {
  static const String routeName = '/view-users-screen';
  const ViewUserScreen({super.key});

  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends State<ViewUserScreen> {
  AuthServices authServices = AuthServices();
  List<User>? userList = [];

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  void fetchAllUsers() async {
    userList = await authServices.fetchAllUsers(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: userList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Registered Users",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            color: Colors.grey[200],
                          ),
                          children: const [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Email',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'College',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...userList!.map(
                          (user) => TableRow(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.fullName,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.email,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.college,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.type,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
