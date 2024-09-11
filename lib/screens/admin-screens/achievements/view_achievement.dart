import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/models/achievement.dart';
import 'package:technozia/services/auth_services.dart';

class ViewAchievementScreen extends StatefulWidget {
  static const String routeName = "/view-achievement-screen";
  const ViewAchievementScreen({super.key});

  @override
  State<ViewAchievementScreen> createState() => _ViewAchievementScreenState();
}

class _ViewAchievementScreenState extends State<ViewAchievementScreen> {
  AuthServices authServices = AuthServices();
  List<Achievement>? achievements;
  @override
  void initState() {
    super.initState();
    getAllAchievement();
  }

  void getAllAchievement() async {
    achievements = await authServices.fetchAllAchievements(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Achievements",
            style: TextStyle(color: GlobalVariables.appBarContentColor),
          ),
          centerTitle: true,
        ),
        backgroundColor: GlobalVariables.bodyBackgroundColor,
        body: achievements == null
            ? const Center(child: CircularProgressIndicator())
            : achievements!.isEmpty
                ? Center(
                    child: Text(
                      "Achievemnts of Academic year 2022-23 will be posted soon",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: GlobalVariables.richBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Summary: ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Total Achievements: ${achievements!.length.toString()} ",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          // color: Colors.yellow,
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return achievementItem(achievements![index]);
                            },
                            itemCount: achievements?.length,
                          ),
                        ),
                      ],
                    ),
                  ));
  }

  Widget achievementItem(Achievement achievement) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 13),
      // height: 550,
      padding: const EdgeInsets.all(16),
      // color: Colors.green,
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      achievement.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      achievement.category,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 200,
              //     aspectRatio: 16 / 9,
              //     viewportFraction: 0.8,
              //     initialPage: 0,
              //     enableInfiniteScroll: true,
              //     reverse: false,
              //     autoPlay: true,
              //     autoPlayInterval: const Duration(seconds: 3),
              //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     enlargeCenterPage: true,
              //     onPageChanged: (index, reason) {
              //       // Do something when the page changes
              //     },
              //     scrollDirection: Axis.horizontal,
              //   ),
              //   items: achievement.images.map((url) {
              //     return SizedBox(
              //       width: double.infinity,
              //       child: Image.network(url, fit: BoxFit.cover),
              //     );
              //   }).toList(),
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  achievement.description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${achievement.tag}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'No of Participant:  ',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: achievement.noOfParticipant.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
