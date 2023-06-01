import 'package:flutter/material.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/services/participant_services.dart';

class TeamMemberItem extends StatefulWidget {
  TeamMember teamMember;
  TeamMemberItem({super.key, required this.teamMember});

  @override
  State<TeamMemberItem> createState() => _TeamMemberItemState();
}

class _TeamMemberItemState extends State<TeamMemberItem> {
  ParticipantServices participantServices = ParticipantServices();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();

  void updateTeamMember() {
    participantServices.updateTeamMember(
      context: context,
      id: widget.teamMember.id,
      fullName: _name.text,
      phoneNo: int.parse(_phoneNo.text),
      email: _email.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.teamMember.fullName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.teamMember.phoneNo.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.teamMember.email,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  scrollable: true,
                                  // title: const Center(
                                  //     child: Text('Add Team Member')),
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            controller: _name,
                                            decoration: const InputDecoration(
                                              labelText: 'Name',
                                              icon: Icon(Icons.label),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _email,
                                            decoration: const InputDecoration(
                                              labelText: 'Email',
                                              icon: Icon(Icons.email),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _phoneNo,
                                            keyboardType: TextInputType.phone,
                                            decoration: const InputDecoration(
                                              labelText: 'Phone Number',
                                              icon:
                                                  Icon(Icons.perm_contact_cal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Color(0xff03071e),
                                          ),
                                        ),
                                        child: const Text("Update"),
                                        onPressed: () {
                                          updateTeamMember();
                                        })
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_forever)),
                    ],
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
