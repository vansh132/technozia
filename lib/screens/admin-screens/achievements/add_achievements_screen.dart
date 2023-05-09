import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
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
      // context: context,
      title: _title.text,
      category: _category.text,
      description: _description.text,
      noOfParticipant: int.parse(_noOfParticipants.text),
      tag: _tag.text,
      images: images,
    );
    print("added achievement..." + _noOfParticipants.text);
    Navigator.pop(context);
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
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _addAchievementFormKey,
            child: Column(
              children: [
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                            builder: (context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
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
                                  'Select Product Images',
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
                  controller: _category,
                  decoration: const InputDecoration(
                    hintText: 'category',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter category';
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
                TextFormField(
                  controller: _noOfParticipants,
                  decoration: const InputDecoration(
                    hintText: 'No of participant',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter valid participants';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tag,
                  decoration: const InputDecoration(
                    hintText: 'Tag',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter tag';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_addAchievementFormKey.currentState!.validate()) {
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
