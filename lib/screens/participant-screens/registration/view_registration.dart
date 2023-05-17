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
                return Text(
                  duoRegistrationsList![index].participantOne,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                );
              },
              itemCount: duoRegistrationsList?.length,
            ),
    );
  }
}
