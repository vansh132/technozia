import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/volunteer.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/volunteer_services.dart';

class EditDeleteVolunteerScreen extends StatefulWidget {
  static const String routeName = '/edit-delete-volunteer-screen';
  Volunteer volunteer;
  EditDeleteVolunteerScreen({super.key, required this.volunteer});

  @override
  State<EditDeleteVolunteerScreen> createState() =>
      _EditDeleteVolunteerScreenState();
}

class _EditDeleteVolunteerScreenState extends State<EditDeleteVolunteerScreen> {
  final _addVolunteerFormKey = GlobalKey<FormState>();
  VolunteerServices volunteerServices = VolunteerServices();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _event = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name.text = widget.volunteer.name;
    _phoneNo.text = widget.volunteer.phoneNo.toString();
    _event.text = widget.volunteer.event;
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _phoneNo.dispose();
    _event.dispose();
  }

  void updateVolunteer(BuildContext context) {
    volunteerServices.updateVolunteer(
      addedBy: widget.volunteer.addedBy,
      context: context,
      id: widget.volunteer.id,
      event: _event.text,
      name: _name.text,
      phoneNo: int.parse(_phoneNo.text),
    );
    setState(() {});
  }

  void addVolunteer() {
    volunteerServices.addVolunteer(
      context: context,
      name: _name.text,
      phoneNo: int.parse(_phoneNo.text),
      event: _event.text.toLowerCase().toString(),
    );
  }

  void deleteVolunteer() {
    volunteerServices.deleteVolunteer(
        context: context,
        volunteer: widget.volunteer,
        onSuccess: () {
          showSnackBar(
              context, "Volunteer Deleted Successfully!! Please Refresh.");
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Volunteer"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  deleteVolunteer();
                },
                icon: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _addVolunteerFormKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text(
                        "Added by : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        widget.volunteer.addedBy,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      /* Text(
                        user.type,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ), */
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text(
                        "Modifiying by : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 80, 80, 80),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user.fullName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      /* Text(
                        user.type,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ), */
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GlobalVariables.appBarColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _phoneNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Phone No',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GlobalVariables.appBarColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                  ),
                  validator: (val) {
                    if (val!.length != 10) {
                      return 'Phone No must be 10 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _event,
                  decoration: InputDecoration(
                    labelText: 'Event',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GlobalVariables.appBarColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter the event';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_addVolunteerFormKey.currentState!.validate()) {
                      updateVolunteer(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: GlobalVariables.appBarColor, // Text color
                    elevation: 8, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0), // Button padding
                  ),
                  child: const Text(
                    "Update Volunteer",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
