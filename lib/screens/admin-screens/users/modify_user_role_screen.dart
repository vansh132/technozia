import 'package:flutter/material.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/services/auth_services.dart';

class ModifyUserRoleScreen extends StatefulWidget {
  static const String routeName = "/modify-user-role-screen";
  const ModifyUserRoleScreen({super.key});

  @override
  State<ModifyUserRoleScreen> createState() => _ModifyUserRoleScreenState();
}

class _ModifyUserRoleScreenState extends State<ModifyUserRoleScreen> {
  AuthServices authServices = AuthServices();
  List<User>? userList = [];

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  void fetchAllUsers() async {
    userList = await authServices.fetchAllUsers(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  userList![index].fullName,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            );
          },
          itemCount: userList!.length,
        ),
      ),
    );
  }
}
