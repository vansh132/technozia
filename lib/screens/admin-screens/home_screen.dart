import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:technozia/screens/admin-screens/achievements/add_achievements_screen.dart';
import 'package:technozia/screens/admin-screens/achievements/view_achievement.dart';
import 'package:technozia/screens/admin-screens/posts/add_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/view_post_screen.dart';
import 'package:technozia/screens/admin-screens/registrations/view_registrations.dart';
import 'package:technozia/screens/admin-screens/users/view_users_screen.dart';
import 'package:technozia/services/auth_services.dart';

class AdminHome extends StatefulWidget {
  static const String routeName = '/admin-screen';

  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  AuthServices authServices = AuthServices();
  List<num> countList = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    getCount(context);
  }

  void getCount(BuildContext context) async {
    countList = await authServices.fetchCount(context);
    print(countList);
    Future.delayed(
      const Duration(seconds: 20),
      () {},
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Coding": countList.elementAt(0).toDouble(),
      "Web": countList.elementAt(1).toDouble(),
      "IT Manager": countList.elementAt(2).toDouble(),
      "Fast Typing": countList.elementAt(3).toDouble(),
      "IT Quiz": countList.elementAt(4).toDouble(),
      "COD Mobile": countList.elementAt(5).toDouble(),
      "Treasure Hunt": countList.elementAt(6).toDouble(),
    };

    List<Color> colorList = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
      Colors.pink,
      Colors.teal,
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                authServices.logOut(context);
              },
              child: const Text("Log out"))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                // centerText: "HYBRID",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.black,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddAchievementScreen.routeName);
              },
              child: const Text(
                "Add Achievement",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPostScreen.routeName);
              },
              child: const Text(
                "Add post",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Call meeting",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewRegistrations.routeName);
              },
              child: const Text(
                "Registration Status",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewAchievementScreen.routeName);
              },
              child: const Text(
                "View Achievements",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewPostScreen.routeName);
              },
              child: const Text(
                "View post",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ViewUserScreen.routeName);
              },
              child: const Text(
                "View user",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
