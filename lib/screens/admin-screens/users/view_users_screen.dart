import 'package:flutter/material.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/services/auth_services.dart';

class ViewUserScreen extends StatefulWidget {
  static const String routeName = '/view-users-screen';
  const ViewUserScreen({super.key});

  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends State<ViewUserScreen> {
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
        body: ListView.builder(
          itemCount: userList?.length,
          itemBuilder: (context, index) {
            return userList == null
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      Text(
                        userList![index].email,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
          },
        ));
  }
}
