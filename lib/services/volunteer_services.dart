// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:technozia/constants/error_handling.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/volunteer.dart';
import 'package:technozia/providers/user_provider.dart';

class VolunteerServices {
  Future<void> addVolunteer({
    required BuildContext context,
    required String name,
    required int phoneNo,
    required String event,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      Volunteer volunteer = Volunteer(
        "",
        user.fullName,
        "null",
        name,
        phoneNo,
        event,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-volunteer'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
        body: volunteer.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Volunteer Added Successfully! Please Refresh');
          // Navigator.of(context).pop();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void updateVolunteer({
    required BuildContext context,
    required String id,
    required String name,
    required String addedBy,
    required int phoneNo,
    required String event,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final userData = {
      "_id": id,
      "addedBy": addedBy,
      "modifiedBy": user.fullName,
      "name": name,
      "phoneNo": phoneNo,
      "event": event,
    };

    try {
      http.Response res = await http.post(Uri.parse("$uri/update/volunteer"),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8',
            // 'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode(userData));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Volunteer Details Updated!! Please Refresh.");
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Volunteer>> fetchAllTeamMembers(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Volunteer> volunteerList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/volunteers"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
          'leader': userProvider.user.id,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            volunteerList.add(
              Volunteer.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return volunteerList;
  }

  void deleteVolunteer({
    required BuildContext context,
    required Volunteer volunteer,
    required VoidCallback onSuccess,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/delete-volunteer'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': volunteer.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
