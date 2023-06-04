import 'package:flutter/material.dart';
import 'package:technozia/models/duoRegistration.dart';
import 'package:technozia/services/registration_services.dart';

class ViewRegisterScreen extends StatefulWidget {
  static const String routeName = '/view-register-screen';
  const ViewRegisterScreen({super.key});

  @override
  State<ViewRegisterScreen> createState() => _ViewRegisterScreenState();
}

class _ViewRegisterScreenState extends State<ViewRegisterScreen> {
  List<DuoRegistration>? duoRegistrationsList;
  RegistrationServices registrationServices = RegistrationServices();

  @override
  void initState() {
    super.initState();
    getRegistrations();
  }

  Future<List<DuoRegistration>?> getRegistrations() async {
    duoRegistrationsList =
        await registrationServices.fetchAllRegistrations(context);
    print(duoRegistrationsList);
    setState(() {});
    return duoRegistrationsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: duoRegistrationsList == null
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const Text(
                    "Registrations",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    // color: Colors.black,

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
                          1: FlexColumnWidth(3),
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
                                    'Phone',
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
                          ...duoRegistrationsList!
                              .map((registration) => TableRow(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            registration.participantOne,
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
                                            registration.email,
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
                                            registration.phoneNo.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}

