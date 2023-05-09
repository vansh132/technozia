import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = '/add-post-screen';
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _addPostFormKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  void onSubmit() {
    print("Post added...");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _addPostFormKey,
            child: Column(
              children: [
                //To-do: user full name - for ui reference
                Text(
                  user.fullName,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  controller: _title,
                  decoration: const InputDecoration(
                    hintText: 'title',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(
                    hintText: 'description',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter Description';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_addPostFormKey.currentState!.validate()) {
                      onSubmit();
                    }
                  },
                  child: const Text(
                    "Sign up",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
