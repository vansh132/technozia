// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technozia/constants/error_handling.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/main-screens/login_screen.dart';
import 'package:technozia/models/achievement.dart';
import 'package:technozia/models/post.dart';
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
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
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
          await pref.setString("x-auth-token", jsonDecode(res.body)['token']);
        },
      );
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<User>> getUser(BuildContext context, String userId) async {
    List<User> userList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/user"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
          "userId": userId,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              User.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
          // userList.add(User.fromJson(jsonDecode(res.body)));
          // print(userList);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return userList;
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
    } catch (e) {
      showSnackBar(context, e.toString());
    }
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
    try {
      final cloudinary = CloudinaryPublic("dq1q5mtdo", "fwsfdscu");
      List<String> imageUrl = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse cloudinaryRes = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: title,
          ),
        );
        imageUrl.add(cloudinaryRes.secureUrl);
      }

      Achievement achievement = Achievement(
        title: title,
        category: category,
        description: description,
        noOfParticipant: noOfParticipant,
        tag: tag,
        images: imageUrl,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-achievement'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
        body: achievement.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // print("product added successfully...");
          // showSnackBar(c, "Product Added successfully.");
          // if (!context.mounted) return;
          showSnackBar(context, 'Product Added Successfully!');
          // Navigator.pop(context, rootNavigator: true);
          Navigator.of(context, rootNavigator: true).pop();
          // Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Achievement>> fetchAllAchievements(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Achievement> achievementList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/achievement"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            achievementList.add(
              Achievement.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return achievementList;
  }

  Future<List<Post>> fetchAllPost(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Post> postList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/post"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            postList.add(
              Post.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return postList;
  }

  Future<List<num>> fetchCount(BuildContext context) async {
    List<num> countList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/report/event-registration-count"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (var i = 0; i < jsonDecode(res.body).length; i++) {
            countList.add(jsonDecode(res.body)[i]);
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return countList;
  }

  Future<List<num>> fetchPaymentCount(BuildContext context) async {
    List<num> countList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/report/payment-count"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (var i = 0; i < jsonDecode(res.body).length; i++) {
            countList.add(jsonDecode(res.body)[i]);
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return countList;
  }

  Future<List<num>> fetchUserCount(BuildContext context) async {
    List<num> countList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/report/user-count"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (var i = 0; i < jsonDecode(res.body).length; i++) {
            countList.add(jsonDecode(res.body)[i]);
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return countList;
  }

  Future<void> addpost({
    required BuildContext context,
    required String username,
    required String type,
    required String title,
    required String description,
    required DateTime date,
  }) async {
    try {
      Post post = Post(
        username: username,
        type: type,
        title: title,
        description: description,
        date: date.toString(),
      );

      await http.post(
        Uri.parse('$uri/admin/add-post'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
        body: post.toJson(),
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<User>> fetchAllUsers(BuildContext context) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<User> userList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/users"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              User.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return userList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString("x-auth-token", "");
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void updateUserProfile({
    required BuildContext context,
    required String fullName,
    required int phoneNo,
    required String email,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final userData = {
      "_id": user.id,
      "fullName": fullName,
      "phoneNo": phoneNo,
      "email": email
    };
    try {
      http.Response res = await http.post(Uri.parse("$uri/update/user"),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8',
            // 'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode(userData));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "user updated...");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
