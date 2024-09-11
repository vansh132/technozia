import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/technozia_logo.png'),
                height: 36,
                width: 36,
              ),
              SizedBox(
                width: 24,
              ),
              Text("Technozia"),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xff03071e),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 250,
              height: 250,
              child: Image(
                image: AssetImage('assets/technozia_logo.png'),
                // fit: BoxFit.cover,
                // height: 36,
                // width: 36,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Technozia',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
