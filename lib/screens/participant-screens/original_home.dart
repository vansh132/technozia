import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/participant-screens/registration/view_registration.dart';
import 'package:technozia/services/auth_services.dart';
import 'package:url_launcher/url_launcher.dart';

class OriginalHomeScreen extends StatefulWidget {
  static const String routeName = "/original-homescreen";
  const OriginalHomeScreen({super.key});

  @override
  State<OriginalHomeScreen> createState() => _OriginalHomeScreenState();
}

/*
https://drive.google.com/file/d/16-C0sMwTc55i1oJ7cImfUhLqvCKG3PQp/view?usp=share_link 
 */

class _OriginalHomeScreenState extends State<OriginalHomeScreen> {
  final String _url =
      "https://drive.google.com/file/d/16-C0sMwTc55i1oJ7cImfUhLqvCKG3PQp/view?usp=share_link";
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: true).user;
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       statusBarColor: Color(0xffced4da)), // Set your desired color here
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffe9ecef),
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
        actions: const [
          // IconButton(
          //     onPressed: null,
          //     icon: Icon(
          //       Icons.logout,
          //       color: Colors.white,
          //     ))
        ],
      ),
      backgroundColor: const Color(0xffe9ecef), //0xffa8dadc // 0xffe8eddf
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            topBar(user),
            ElevatedButton(
              onPressed: _launchUrl,
              child: const Text("Brochure"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewRegisterScreen.routeName);
              },
              child: Text("View Registrations"),
            )
          ],
        ),
      )),
    );
  }

  Widget topBar(User user) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.all(16),
      height: 48,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 2),
            child: Text(
              user.fullName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                authServices.logOut(context);
              },
              child: Row(
                children: [
                  Text("Log out"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.logout_rounded,
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
