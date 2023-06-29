import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:technozia/models/options.dart';
import 'package:technozia/screens/admin-screens/achievements/add_achievements_screen.dart';
import 'package:technozia/screens/admin-screens/achievements/view_update_achievement.dart';
import 'package:technozia/screens/admin-screens/posts/add_post_screen.dart';
import 'package:technozia/screens/admin-screens/posts/view_update_post.dart';
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
  List<num> paymentCount = [0, 0];
  List<num> userCount = [0, 0, 0];
  List<Option> optionsList = [
    Option(
        imageUrl: "imageUrl",
        title: "Add Achievement",
        routeName: AddAchievementScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "View Achievement",
        routeName: ViewUpdateAchievementScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "Add Post",
        routeName: AddPostScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "View Post",
        routeName: ViewEditPostScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "View Users",
        routeName: ViewUserScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "View Registrations",
        routeName: ViewRegistrations.routeName),
  ];

  @override
  void initState() {
    super.initState();
    getCount(context);
    getPaymentCount(context);
    getUserCount(context);
  }

  void getCount(BuildContext context) async {
    countList = await authServices.fetchCount(context);
    Future.delayed(
      const Duration(seconds: 10),
      () {},
    );
    setState(() {});
  }

  void getPaymentCount(BuildContext context) async {
    paymentCount = await authServices.fetchPaymentCount(context);
    Future.delayed(
      const Duration(seconds: 10),
      () {},
    );
    setState(() {});
  }

  void getUserCount(BuildContext context) async {
    userCount = await authServices.fetchUserCount(context);
    Future.delayed(
      const Duration(seconds: 10),
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
        title: const Text("Admin"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                authServices.logOut(context);
              },
              child: const Text("Log out"))
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
              Container(
                width: double.infinity,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Payment Summary",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      endIndent: 48,
                      indent: 48,
                      color: Colors.black,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Online: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: paymentCount.elementAt(0).toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Offline: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: paymentCount.elementAt(1).toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "User Summary",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      endIndent: 48,
                      indent: 48,
                      color: Colors.black,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Total Registered Users: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: userCount.elementAt(0).toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Total Posts: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: userCount.elementAt(1).toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Total Achievement: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: userCount.elementAt(2).toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 425,
                width: 450,
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 10, // Spacing between rows
                    crossAxisSpacing: 10, // Spacing between columns
                  ),
                  itemCount: optionsList.length, // Number of items in the grid
                  itemBuilder: (BuildContext context, int index) {
                    return options(optionsList[index].imageUrl,
                        optionsList[index].title, optionsList[index].routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(String imgUrl, String title, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.ac_unit),
            const SizedBox(
              height: 24,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
