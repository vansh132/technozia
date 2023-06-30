import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/options.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/admin-screens/achievements/view_achievement.dart';
import 'package:technozia/screens/admin-screens/posts/add_post_screen.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/add_volunteer_screen.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/view_volunteer_screen.dart';
import 'package:technozia/services/auth_services.dart';
import 'package:url_launcher/url_launcher.dart';

class OriginalCoreHome extends StatefulWidget {
  static const String routeName = '/original-home-core';
  const OriginalCoreHome({super.key});

  @override
  State<OriginalCoreHome> createState() => _OriginalCoreHomeState();
}

class _OriginalCoreHomeState extends State<OriginalCoreHome> {
  AuthServices authServices = AuthServices();
  List<num> countList = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  List<Option> optionsList = [
    Option(
        imageUrl: "imageUrl",
        title: "Add Volunteer",
        routeName: AddVolunteerScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "View Volunteer",
        routeName: ViewVolunteerListScreen.routeName),
    Option(
        imageUrl: "imageUrl",
        title: "Add Post",
        routeName: AddPostScreen.routeName),
  ];

  @override
  void initState() {
    super.initState();
    getCount(context);
  }

  void getCount(BuildContext context) async {
    countList = await authServices.fetchCount(context);
    Future.delayed(
      const Duration(seconds: 10),
      () {},
    );
    setState(() {});
  }

  final String _url =
      "https://drive.google.com/file/d/16-C0sMwTc55i1oJ7cImfUhLqvCKG3PQp/view?usp=share_link";
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

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
                ),
              ),
              Container(
                height: 224,
                width: 450,
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Number of columns
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
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    brochure(),
                    achievement(),
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
              "${user.fullName} - Core Team",
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

  Widget brochure() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            colorFilter: ColorFilter.matrix([
              0.3, 0, 0, 0, 0, // Red channel
              0, 0.6, 0, 0, 0, // Green channel
              0, 0, 0.9, 0, 0, // Blue channel
              0, 0, 0, 1, 0, // Alpha channel
            ]),
            image: NetworkImage(
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1685104908/banners/ftnoe0d1lalavnxik2ir.jpg",
            ),
            fit: BoxFit.cover,
          ),
          // color: Colors.redAccent,
        ),
        width: MediaQuery.of(context).size.width * 0.43,
        height: 224,
        child: ElevatedButton.icon(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Color(0xffF5F7FA),
          )),
          onPressed: _launchUrl,
          icon: const Icon(
            Icons.download_for_offline,
            color: Color(0xff03071e),
          ),
          label: const Text(
            "Brochure",
            style: TextStyle(color: Color(0xff03071e)),
          ),
        ),
      ),
    );
  }

  Widget achievement() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.9,
            filterQuality: FilterQuality.high,
            colorFilter: ColorFilter.matrix([
              0.9, 0, 0, 0, 0, // Red channel
              0, 0.9, 0, 0, 0, // Green channel
              0, 0, 0.6, 0, 0, // Blue channel
              0, 0, 0, 0.9, 0, // Alpha channel
            ]),
            image: NetworkImage(
              "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1685106739/banners/bkmthx7zwykxddcqlta3.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.43,
        height: 224,
        child: ElevatedButton.icon(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Color(0xffF5F7FA),
          )),
          onPressed: () {
            Navigator.pushNamed(context, ViewAchievementScreen.routeName);
          },
          icon: const Icon(
            Icons.wine_bar,
            color: Color(0xff03071e),
          ),
          label: const Text(
            "Championship",
            style: TextStyle(color: Color(0xff03071e)),
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
        // color: Colors.grey[200],
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
