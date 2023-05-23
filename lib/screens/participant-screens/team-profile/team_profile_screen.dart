import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/participant-screens/items/team_member_item.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Color(0xff03071e)), // Set your desired color here
    );
    final user = Provider.of<UserProvider>(context, listen: true).user;
    return Scaffold(
      // backgroundColor: Colors. black,
      backgroundColor: const Color(0xfff8f8f8),

      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                getAllTeamMembers(context);
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: teamMembersList == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xff03071e),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.college,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff03071e),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Team Members",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff03071e),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 570,
                      child: ListView.builder(
                        itemBuilder: (context, index) => TeamMemberItem(
                          teamMember: teamMembersList![index],
                        ),
                        itemCount: teamMembersList?.length,
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Center(child: Text('Add Team Member')),
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
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xff03071e),
                            ),
                          ),
                          child: const Text("Add"),
                          onPressed: () {
                            addTeamMember();
                          })
                    ],
                  );
                });
          },
          color: Colors.white,
          icon: const Icon(
            Icons.add,
            // color: Colors.white,
          )),
    );
  }
}
