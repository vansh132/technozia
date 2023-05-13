import 'package:flutter/material.dart';
import 'package:technozia/models/events.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/services/participant_services.dart';

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

class _RegistrationScreenState extends State<RegistrationScreen> {
  ParticipantServices participantServices = ParticipantServices();
  List<TeamMember>? teamMembers;

  void getTeamMembers() async {
    teamMembers = await participantServices.fetchAllTeamMembers(context);
    print(teamMembers);
    setState(() {});
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
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)?.settings.arguments as Event;
    List<String>? dropdownItems = teamMembers?.map((e) => e.fullName).toList();
    return Scaffold(
      appBar: AppBar(),
      body: teamMembers == null
          ? CircularProgressIndicator()
          : Column(
              children: [
                DropdownButton<String>(
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
              ],
            ),
    );
  }
}
