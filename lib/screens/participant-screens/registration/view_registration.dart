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
          : ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(
                      duoRegistrationsList![index].participantOne,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      duoRegistrationsList![index].email,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      duoRegistrationsList![index].eventName,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
              itemCount: duoRegistrationsList?.length,
            ),
    );
  }
}
