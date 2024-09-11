import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
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
    setState(() {});
    return duoRegistrationsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.appBarColor,
          leadingWidth: 172,
          elevation: 2,
          centerTitle: true,
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "Registrations",
              style: TextStyle(
                fontSize: 20,
                color: GlobalVariables.appBarContentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: duoRegistrationsList == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff03071e),
                ),
              )
            : duoRegistrationsList!.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: Text(
                        "No Registrations are made yet",
                        style: TextStyle(
                          fontSize: 20,
                          color: GlobalVariables.richBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Confirmed Registrations",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: GlobalVariables.richBlackColor,
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
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(3),
                              2: FlexColumnWidth(3.5),
                              3: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  // color: GlobalVariables.richBlackColor,
                                  color: Colors.grey[200],
                                ),
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Name',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: GlobalVariables.richBlackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Email',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                GlobalVariables.richBlackColor),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Phone',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: GlobalVariables.richBlackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: GlobalVariables.richBlackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...duoRegistrationsList!.map((registration) =>
                                  TableRow(
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
                                            style: TextStyle(
                                              color: GlobalVariables
                                                  .richBlackColor,
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
                                            style: TextStyle(
                                              color: GlobalVariables
                                                  .richBlackColor,
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
                                            style: TextStyle(
                                              color: GlobalVariables
                                                  .richBlackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            registration.eventName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: GlobalVariables
                                                  .richBlackColor,
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
