import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/auth_services.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = '/add-post-screen';
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _addPostFormKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  void onSubmit(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;

    authServices.addpost(
      context: context,
      username: user.fullName,
      type: user.type,
      title: _title.text,
      description: _description.text,
      date: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        backgroundColor: GlobalVariables.bodyBackgroundColor,
        appBar: AppBar(
          backgroundColor: GlobalVariables.appBarColor,
          title: Text(
            "Add your Post",
            style: TextStyle(color: GlobalVariables.appBarContentColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _addPostFormKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: GlobalVariables.secondaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Author : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          user.fullName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _title,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalVariables.appBarColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _description,
                    minLines: 4,
                    maxLines: 100,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalVariables.appBarColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter Description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_addPostFormKey.currentState!.validate()) {
                        onSubmit(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          GlobalVariables.appBarColor, // Text color
                      elevation: 8, // Elevation (shadow)
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0), // Button padding
                    ),
                    child: const Text(
                      "Add Post",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
