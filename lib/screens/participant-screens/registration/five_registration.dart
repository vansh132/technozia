import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/duoRegistration.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/participant_services.dart';
import 'package:technozia/services/registration_services.dart';

class FiveRegistrationScreen extends StatefulWidget {
  static const String routeName = "/five-registration-screen";
  final Event event;
  const FiveRegistrationScreen({super.key, required this.event});

  @override
  State<FiveRegistrationScreen> createState() => _FiveRegistrationScreenState();
}

enum PaymentMode { online, offline }

class _FiveRegistrationScreenState extends State<FiveRegistrationScreen> {
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
      participantThree: "null",
      participantFour: "null",
      participantFive: "null",
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

  String? selectedValue1 = "";
  String? selectedValue2 = "";
  String? selectedValue3 = "";
  String? selectedValue4 = "";
  String? selectedValue5 = "";
  String? participant1;
  String? participant2;
  String? participant3;
  String? participant4;
  String? participant5;
  PaymentMode? _character = PaymentMode.online;
  @override
  Widget build(BuildContext context) {
    _paymentId.text = "";
    final user = Provider.of<UserProvider>(context).user;
    final event = ModalRoute.of(context)?.settings.arguments as Event;
    List<String>? dropdownItems = teamMembers?.map((e) => e.fullName).toList();
    return Scaffold(
      appBar: AppBar(),
      body: teamMembers == null
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(
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
                DropdownButton<String>(
                  hint: const Text("Team member 3"),
                  value: selectedValue3!.isNotEmpty ? selectedValue3 : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue3 = newValue!;
                      participant3 = selectedValue3;
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
                  hint: const Text("Team member 4"),
                  value: selectedValue4!.isNotEmpty ? selectedValue4 : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue4 = newValue!;
                      participant4 = selectedValue4;
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
                  hint: const Text("Team member 5"),
                  value: selectedValue5!.isNotEmpty ? selectedValue5 : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue5 = newValue!;
                      participant5 = selectedValue5;
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
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.event.price.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text('Online'),
                  leading: Radio<PaymentMode>(
                    value: PaymentMode.online,
                    groupValue: _character,
                    onChanged: (PaymentMode? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Offline'),
                  leading: Radio<PaymentMode>(
                    value: PaymentMode.offline,
                    groupValue: _character,
                    onChanged: (PaymentMode? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                PaymentMode.online == _character
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
                    : const SizedBox(
                        height: 8,
                      ),
                Text(
                  DateTime.now().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      onRegister();
                    },
                    child: const Text("Register Now"))
              ],
            ),
    );
  }
}
