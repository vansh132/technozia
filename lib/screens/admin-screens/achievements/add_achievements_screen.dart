import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/services/auth_services.dart';

class AddAchievementScreen extends StatefulWidget {
  static const String routeName = '/add-achievement-screen';
  const AddAchievementScreen({super.key});

  @override
  State<AddAchievementScreen> createState() => _AddAchievementScreenState();
}

class _AddAchievementScreenState extends State<AddAchievementScreen> {
  AuthServices authServices = AuthServices();
  final _addAchievementFormKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _noOfParticipants = TextEditingController();
  final TextEditingController _tag = TextEditingController();

  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _category.dispose();
    _description.dispose();
    _noOfParticipants.dispose();
    _tag.dispose();
  }

  void onSubmit() {
    authServices.addAchievement(
      context: context,
      title: _title.text,
      category: _category.text,
      description: _description.text,
      noOfParticipant: int.parse(_noOfParticipants.text),
      tag: _tag.text,
      images: images,
    );
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.appBarColor,
          title: Text(
            "Add Achievements",
            style: TextStyle(color: GlobalVariables.appBarContentColor),
          ),
          centerTitle: true,
        ),
        backgroundColor: GlobalVariables.bodyBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _addAchievementFormKey,
              child: Column(
                children: [
                  images.isNotEmpty
                      // ? CarouselSlider(
                      //     items: images.map((i) {
                      //       return Builder(
                      //         builder: (context) => Image.file(
                      //           i,
                      //           fit: BoxFit.cover,
                      //           height: 200,
                      //         ),
                      //       );
                      //     }).toList(),
                      //     options: CarouselOptions(
                      //       viewportFraction: 1,
                      //       height: 200,
                      //     ),
                      //   )
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Select Achievement Images',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 12,
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
                    height: 12,
                  ),
                  TextFormField(
                    controller: _category,
                    decoration: InputDecoration(
                      labelText: 'Category',
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
                        return 'Enter category';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
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
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _noOfParticipants,
                    decoration: InputDecoration(
                      labelText: 'No of Participants',
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
                        return 'Enter valid participants';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _tag,
                    decoration: InputDecoration(
                      labelText: 'Tag',
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
                        return 'Enter tag';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_addAchievementFormKey.currentState!.validate()) {
                        onSubmit();
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
                      "Add Achievement",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
