// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:technozia/constants/error_handling.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/achievement.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/providers/user_provider.dart';

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String fullName,
    required String college,
    required int phoneNo,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        college: college,
        phoneNo: phoneNo,
        email: email,
        password: password,
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account created...");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          var r = await pref.setString(
              "x-auth-token", jsonDecode(res.body)['token']);
          print("$r - vansh132");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("x-auth-token");
      if (token == null) {
        pref.setString("x-auth-token", '');
      }

      var tokenRes = await http.post(
        Uri.parse("$uri/tokenIsValid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userResponse = await http.get(
          Uri.parse("$uri/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {}
  }

  Future<void> addAchievement({
    required BuildContext context,
    required String title,
    required String category,
    required String description,
    required int noOfParticipant,
    required String tag,
    required List<File> images,
  }) async {
    print("vansh132 - running...");
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final cloudinary = CloudinaryPublic("dq1q5mtdo", "fwsfdscu");
      // final cloudinary = CloudinaryPublic
      List<String> imageUrl = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse cloudinaryRes = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: title,
          ),
        );
        imageUrl.add(cloudinaryRes.secureUrl);
        // Product product = Product(
        //   name: name,
        //   description: description,
        //   quantity: quantity,
        //   price: price,
        //   category: category,
        //   images: imageUrl,
        // );
        Achievement achievement = Achievement(
          title: title,
          category: category,
          description: description,
          noOfParticipant: noOfParticipant,
          tag: tag,
          images: imageUrl,
        );
        print("vansh132 - running above request...");

        http.Response res = await http.post(
          Uri.parse('$uri/admin/add-product'),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8',
            'x-auth-token': user.token,
          },
          body: achievement.toJson(),
        );
        print("vansh132 - running below request...");
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            print("product added successfully...");
            // showSnackBar(c, "Product Added successfully.");
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        );
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e);
    }
  }
}
