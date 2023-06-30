import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/auth_services.dart';

class UserProfile extends StatefulWidget {
  static const String routeName = "/user-profile-screen";
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _LeaderProfileState();
}

class _LeaderProfileState extends State<UserProfile> {
  final _updateUserFormKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  void initState() {
    super.initState();
    authServices.getUserData(context);
  }

  @override
  void dispose() {
    super.dispose();
    _fullName.dispose();
    _phoneNumber.dispose();
    _email.dispose();
  }

  void onSubmit() {
    authServices.updateUserProfile(
      context: context,
      fullName: _fullName.text,
      phoneNo: int.parse(_phoneNumber.text),
      email: _email.text,
    );
  }

  void _refresh() {
    authServices.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    _fullName.text = user.fullName;
    _email.text = user.email;
    _phoneNumber.text = user.phoneNo.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2, //0xffe9ecef
        // leading: ,
        // centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    "assets/technozia_logo.png",
                  ),
                  fit: BoxFit.cover,
                  height: 38,
                  filterQuality: FilterQuality.high,
                  semanticLabel: "Technozia",
                  color: Color(0xff03071e),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Technozia",
                style: TextStyle(
                  color: Color(0xff03071e),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _refresh();
              },
              icon: Icon(
                Icons.refresh,
                color: Color(0xff03071e),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _updateUserFormKey,
          child: Column(
            children: [
              Container(
                height: 148,
                width: 148,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/profile_icon.jpg"),
                    filterQuality: FilterQuality.high,
                    // opacity: 0.9,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _fullName,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person), // Set the prefix icon
                    prefixIconColor: Color(0xff03071e),
                    labelStyle: TextStyle(
                      color: Color(0xff03071e),
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _phoneNumber,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.call_rounded), // Set the prefix icon
                    prefixIconColor: Color(0xff03071e),
                    labelStyle: TextStyle(
                      color: Color(0xff03071e),
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty || val.length != 10) {
                      return 'Enter valid phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail_rounded), // Set the prefix icon
                    prefixIconColor: Color(0xff03071e),
                    labelStyle: TextStyle(
                      color: Color(0xff03071e),
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xff03071e),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(150, 36)),
                    textStyle: const MaterialStatePropertyAll(
                      TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    )),
                onPressed: () {
                  if (_updateUserFormKey.currentState!.validate()) {
                    onSubmit();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Save",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
