import 'package:flutter/material.dart';
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
    print(achievements);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: achievements == null
            ? const CircularProgressIndicator()
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return achievementItem(achievements![index]);
                  },
                  itemCount: achievements?.length,
                ),
              ));
  }

  Widget achievementItem(Achievement achievement) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 13),
      height: 550,
      padding: EdgeInsets.all(16),
      color: Colors.black,
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
                    ),
                    Text(
                      achievement.category,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
