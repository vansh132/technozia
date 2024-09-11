import 'package:flutter/material.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/services/participant_services.dart';

class TeamMemberItem extends StatefulWidget {
  final TeamMember teamMember;
  const TeamMemberItem({super.key, required this.teamMember});

  @override
  State<TeamMemberItem> createState() => _TeamMemberItemState();
}

class _TeamMemberItemState extends State<TeamMemberItem> {
  ParticipantServices participantServices = ParticipantServices();
  final _updateFormKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();

  void updateTeamMember() {
    participantServices.updateTeamMember(
      context: context,
      id: widget.teamMember.id,
      fullName: _name.text,
      phoneNo: 9898989889,
      email: _email.text,
    );
    setState(() {});
  }

  void deleteMember() {
    participantServices.deleteTeamMember(
        context: context,
        teamMember: widget.teamMember,
        onSuccess: () {
          showSnackBar(
              context, "Team Member Deleted Successfully!! Please Refresh.");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Theme(
        data: ThemeData(
          primaryColor: const Color(0xff03071e),
          unselectedWidgetColor: Colors.grey,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xff03071e)),
        ),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.all(8),
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
          title: Text(
            widget.teamMember.fullName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          children: [
            Text(
              widget.teamMember.college,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.teamMember.email,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.teamMember.phoneNo.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                              key: _updateFormKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: _name,
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                      icon: Icon(Icons.label),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _email,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      icon: Icon(Icons.email),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Email';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _phoneNo,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      labelText: 'Phone Number',
                                      icon: Icon(Icons.perm_contact_cal),
                                    ),
                                    validator: (value) {
                                      if (value!.length != 10) {
                                        return 'Phone Number must be 10 digits';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xff03071e),
                                  ),
                                ),
                                child: const Text("Update"),
                                onPressed: () {
                                  if (_updateFormKey.currentState!.validate()) {
                                    updateTeamMember();
                                  }
                                })
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      deleteMember();
                    },
                    child: const Icon(Icons.delete_forever_rounded)),
                const SizedBox(
                  width: 8,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
Column(
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
 */