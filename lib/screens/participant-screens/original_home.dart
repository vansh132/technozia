import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xff03071e)), // Set your desired color here
    );
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage("assets/technozia_logo.png")),
        ),
        centerTitle: true,
        title: Text("Technozia"),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
          // Image(
          //   image: AssetImage("assets/technozia_logo.png"),
          // ),
          // Text("Technozia ")
        ],
      ),
      backgroundColor: Color(0xff03071e),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // topBar(),
            ElevatedButton(onPressed: _launchUrl, child: Text("Brochure"))
          ],
        ),
      )),
    );
  }

  Widget topBar() {
    return Container(
      width: double.infinity,
      height: 48,
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/technozia_logo.png"),
          ),
          Text("Technozia ")
        ],
      ),
    );
  }
}
