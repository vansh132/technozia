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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  achievements![index].title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 24,
                  // height: 100,
                  // child: Image.network(achievements![index].images[0]),
                ),
                Text(
                  achievements![index].description,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            );
          },
          itemCount: achievements!.length,
        ));
  }
}
