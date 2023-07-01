import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/screens/admin-screens/achievements/participant_achievement.dart';
import 'package:technozia/screens/participant-screens/events/coding_screen.dart';
import 'package:technozia/screens/participant-screens/events/fast_typing.dart';
import 'package:technozia/screens/participant-screens/events/gaming_screen.dart';
import 'package:technozia/screens/participant-screens/events/it_manager_screen.dart';
import 'package:technozia/screens/participant-screens/events/it_quiz_screen.dart';
import 'package:technozia/screens/participant-screens/events/treasurehunt_screen.dart';
import 'package:technozia/screens/participant-screens/events/web_design_screen.dart';
import 'package:technozia/services/auth_services.dart';
import 'package:url_launcher/url_launcher.dart';

class OriginalHomeScreen extends StatefulWidget {
  static const String routeName = "/original-homescreen";
  const OriginalHomeScreen({super.key});

  @override
  State<OriginalHomeScreen> createState() => _OriginalHomeScreenState();
}

class _OriginalHomeScreenState extends State<OriginalHomeScreen> {
  AuthServices authServices = AuthServices();

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
      const SystemUiOverlayStyle(
          statusBarColor: Color(0xff14213D)), // Set your desired color here
    );
    final user = Provider.of<UserProvider>(context, listen: true).user;
    List<Widget> carouselImages = [
      banners(
          "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036478/events%20-%20static%20images/banners/cgh0lzkvwg4wdxek1lf3.png"),
      banners(
          "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036478/events%20-%20static%20images/banners/gpf5deqogngf3n3g871d.png"),
      banners(
          "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036477/events%20-%20static%20images/banners/j4gvc7bznotfq6xzyy0p.png"),
      banners(
          "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036477/events%20-%20static%20images/banners/lxfwtgbvgxpoxhdcis40.png"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14213D),
        elevation: 2,
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
                  color: Color(0XFFbde0fe),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Technozia",
                style: TextStyle(
                  color: Color(0XFFbde0fe),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor:
          GlobalVariables.bodyBackgroundColor, //0xffa8dadc // 0xffe8eddf //
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .50,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: carouselImages,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 372,
                    autoPlay: true,
                  ),
                ),
              ),
              const Text(
                "Events",
                style: TextStyle(
                  color: Color(0xff03071e),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .30,
                width: MediaQuery.of(context).size.width,
                child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 8.0, // Spacing between rows
                      crossAxisSpacing: 8.0, // Spacing between columns
                    ),
                    children: [
                      event(
                        "IT Quiz",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036582/events%20-%20static%20images/events/ld8a7zhnbwokox3gl1oi.jpg",
                        ItQuizScreen.routeName,
                      ),
                      event(
                        "Coding",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036582/events%20-%20static%20images/events/idc3h0bssy81g21rdfwo.jpg",
                        CodingScreen.routeName,
                      ),
                      event(
                        "Web Design",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036583/events%20-%20static%20images/events/ujehxn5cinjbanjmvnom.jpg",
                        WebDesignScreen.routeName,
                      ),
                      event(
                        "IT Manager",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036582/events%20-%20static%20images/events/mjrvep6yj2ooobzz5mup.jpg",
                        ItManagerScreen.routeName,
                      ),
                      event(
                        "Gaming",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036584/events%20-%20static%20images/events/smpxorrr8umfl8vwpdlr.jpg",
                        GamingScreen.routeName,
                      ),
                      event(
                        "Fast Typing",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036582/events%20-%20static%20images/events/pgwey4fb3i4wc1fiw37r.jpg",
                        FastTyping.routeName,
                      ),
                      event(
                        "Treasure Hunt",
                        "https://res.cloudinary.com/dq1q5mtdo/image/upload/v1688036583/events%20-%20static%20images/events/yhg4zkbj8ay3phtkmfjg.jpg",
                        TreasureHuntScreen.routeName,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 2,
              ),
              const Divider(
                color: Colors.transparent,
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                // color: Colors.black,
                padding: const EdgeInsets.all(8),
                height: 216,
                width: double.infinity,
                child: excitingPrizes(),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                // color: Colors.yellow,
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
        color: const Color(0xffFCA311),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 24, top: 2),
            child: Text(
              user.fullName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff010B13),
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
                      color: Color(0xff010B13),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.logout_rounded,
                    // color: Colors.white,
                    color: Color(0xff010B13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget banners(String img) {
    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        image: DecorationImage(
          image: NetworkImage(
            img,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height * .30,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget event(
    String name,
    String url,
    String routeName,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  url,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
            //To-Do: Create achievement Screen
            Navigator.pushNamed(
                context, ParticipantAchievementScreen.routeName);
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

  Widget excitingPrizes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Image(
            image: AssetImage(
              "assets/overall_trophy.png",
            ),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Conquer Competition ", //Competition Claim Victory!
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Get Overall Home",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Resources
//
// SystemChrome.setSystemUIOverlayStyle(
//   SystemUiOverlayStyle(
//       statusBarColor: Color(0xffced4da)), // Set your desired color here
// );
/*
https://drive.google.com/file/d/16-C0sMwTc55i1oJ7cImfUhLqvCKG3PQp/view?usp=share_link 
 */
