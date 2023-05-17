import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/duoRegistration.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/participant_services.dart';
import 'package:technozia/services/registration_services.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "/registration-screen";
  final Event event;
  const RegistrationScreen({
    super.key,
    required this.event,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

enum paymentMode { online, offline }

class _RegistrationScreenState extends State<RegistrationScreen> {
  ParticipantServices participantServices = ParticipantServices();
  RegistrationServices registrationServices = RegistrationServices();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _paymentId = TextEditingController();
  List<TeamMember>? teamMembers;
  List<DuoRegistration>? duoRegistrations;

  void getTeamMembers() async {
    teamMembers = await participantServices.fetchAllTeamMembers(context);
    print(teamMembers);
    setState(() {});
  }

  void onRegister() async {
    registrationServices.duoEventregistration(
      context: context,
      participantOne: participant1.toString(),
      participantTwo: participant2.toString(),
      phoneNo: int.parse(_phoneNo.text),
      email: _email.text,
      eventName: widget.event.name,
      amount: widget.event.price,
      paymentMode: _character.toString(),
      paymentId: _paymentId.text,
      date: DateTime.now().toString(),
    );
  }

  @override
  void initState() {
    super.initState();
    getTeamMembers();
  }

  // List<String>? dropdownItems = teamMembers!.map((e) => e.fullName).toList();

  String? selectedValue1 = "";
  String? selectedValue2 = "";
  String? participant1;
  String? participant2;
  paymentMode? _character = paymentMode.online;

  @override
  Widget build(BuildContext context) {
    _paymentId.text = "";
    final user = Provider.of<UserProvider>(context).user;
    final event = ModalRoute.of(context)?.settings.arguments as Event;
    List<String>? dropdownItems = teamMembers?.map((e) => e.fullName).toList();

    return Scaffold(
      appBar: AppBar(),
      body: teamMembers == null
          ? CircularProgressIndicator()
          : Column(
              children: [
                Text(
                  user.fullName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                DropdownButton<String>(
                  hint: const Text("Team member 1"),
                  value: selectedValue1!.isNotEmpty ? selectedValue1 : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue1 = newValue!;
                      participant1 = selectedValue1;
                    });
                  },
                  items: dropdownItems
                      ?.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.isNotEmpty ? value : null,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  hint: const Text("Team member 2"),
                  value: selectedValue2!.isNotEmpty ? selectedValue2 : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue2 = newValue!;
                      participant2 = selectedValue2;
                    });
                  },
                  items: dropdownItems
                      ?.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.isNotEmpty ? value : null,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _phoneNo,
                  decoration: const InputDecoration(
                    hintText: 'Phone no',
                  ),
                  validator: (val) {
                    // if (val.toString() != _password.text) {
                    //   return 'Password not matched';
                    // }
                    // return null;
                  },
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: 'email',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                Text(
                  widget.event.name,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.event.price.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text('Online'),
                  leading: Radio<paymentMode>(
                    value: paymentMode.online,
                    groupValue: _character,
                    onChanged: (paymentMode? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Offline'),
                  leading: Radio<paymentMode>(
                    value: paymentMode.offline,
                    groupValue: _character,
                    onChanged: (paymentMode? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                paymentMode.online == _character
                    ? TextFormField(
                        controller: _paymentId,
                        decoration: const InputDecoration(
                          hintText: 'Payment ID',
                        ),
                        validator: (val) {
                          // if (val == null || val.isEmpty) {
                          //   return 'Enter your email';
                          // }
                          // return null;
                        },
                      )
                    : SizedBox(
                        height: 8,
                      ),
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      onRegister();
                    },
                    child: Text("Register Now"))
              ],
            ),
    );
  }
}
