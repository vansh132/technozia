import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/auth_services.dart';

class OriginalMemberHome extends StatefulWidget {
  static const String routeName = '/original-home-member';
  const OriginalMemberHome({super.key});

  @override
  State<OriginalMemberHome> createState() => _OriginalMemberHomeState();
}

class _OriginalMemberHomeState extends State<OriginalMemberHome> {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              topBar(user),
              const SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  children: const [
                    Text(
                      "Welcome to Technozia",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget topBar(User user) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xff03071e),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 24, top: 2),
            child: Text(
              "${user.fullName} - Member",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                authServices.logOut(context);
              },
              child: Row(
                children: const [
                  Text(
                    "Log out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
