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
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Text(
                    "Registrations",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    // color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: Table(
                        border: TableBorder.all(),
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                                // color: Colors.black,

                                ),
                            children: [
                              TableCell(
                                child: Text(
                                  'Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  'Email',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  'Phone',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...duoRegistrationsList!
                              .map((registration) => TableRow(
                                    children: [
                                      TableCell(
                                        child: Text(
                                          registration.participantOne,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          registration.email,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          registration.phoneNo.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
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


/*

 */