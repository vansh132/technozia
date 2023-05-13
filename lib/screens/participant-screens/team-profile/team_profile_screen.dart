import 'package:flutter/material.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/services/participant_services.dart';

class TeamProfileScreen extends StatefulWidget {
  static const String routeName = '/team-profile-screen';
  const TeamProfileScreen({super.key});

  @override
  State<TeamProfileScreen> createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
  ParticipantServices participantServices = ParticipantServices();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  List<TeamMember>? teamMembersList;

  @override
  void initState() {
    super.initState();
    getAllTeamMembers(context);
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _phoneNo.dispose();
    _email.dispose();
  }

  void addTeamMember() {
    print(_name.text);
    print(_email.text);
    print(_phoneNo.text);
    participantServices.addTeamMember(
      context: context,
      fullName: _name.text,
      email: _email.text,
      phoneNo: int.parse(_phoneNo.text),
    );
  }

  void getAllTeamMembers(BuildContext context) async {
    teamMembersList = await participantServices.fetchAllTeamMembers(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors. black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                getAllTeamMembers(context);
              },
              icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Container(
        child: teamMembersList == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    teamMembersList![index].fullName,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  );
                },
                itemCount: teamMembersList?.length,
              ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('Add Team Member'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _name,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                icon: Icon(Icons.label),
                              ),
                            ),
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField(
                              controller: _phoneNo,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                icon: Icon(Icons.perm_contact_cal),
                              ),
                            ),
                            //Modern Textform field by Chatgpt
                            /* TextFormField(
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                labelText: "labelText",
                                hintText: "hintText",
                                prefixIcon:
                                    Icon(Icons.production_quantity_limits),
                                filled: true,
                                fillColor: Colors.grey[200],
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.5,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.5,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ), */
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          child: Text("Add"),
                          onPressed: () {
                            addTeamMember();
                          })
                    ],
                  );
                });
          },
          icon: Icon(
            Icons.add,
          )),
    );
  }
}
