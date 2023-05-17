import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/providers/user_provider.dart';

class UserProfile extends StatefulWidget {
  static const String routeName = "/user-profile-screen";
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _LeaderProfileState();
}

/*
  full name, phone, email, password
 */

class _LeaderProfileState extends State<UserProfile> {
  final _updateUserFormKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullName.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    _password.dispose();
  }

  void onSubmit() {
    print(_fullName.text);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    _fullName.text = user.fullName;
    _email.text = user.email;
    _phoneNumber.text = user.phoneNo.toString();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _updateUserFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullName,
                decoration: const InputDecoration(
                  hintText: 'full name',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumber,
                decoration: const InputDecoration(
                  hintText: 'phone number',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty || val.length != 10) {
                    return 'Enter valid phone number';
                  }
                  return null;
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
              ElevatedButton(
                onPressed: () {
                  if (_updateUserFormKey.currentState!.validate()) {
                    onSubmit();
                  }
                },
                child: const Text(
                  "save",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
