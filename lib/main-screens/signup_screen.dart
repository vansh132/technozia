import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/sign-up-screen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _college = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullName.dispose();
    _college.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  void onSubmit() {
    print(_fullName.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _signUpKey,
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
                controller: _college,
                decoration: const InputDecoration(
                  hintText: 'college',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter your college';
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
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  hintText: 'password',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty || val.length > 6) {
                    return 'Minimum six character of password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPassword,
                decoration: const InputDecoration(
                  hintText: 'confirm password',
                ),
                validator: (val) {
                  if (val == null ||
                      val.isEmpty ||
                      val.toString() != _password.text) {
                    return 'Password not matched';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_signUpKey.currentState!.validate()) {
                    onSubmit();
                  }
                },
                child: const Text(
                  "Sign up",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
