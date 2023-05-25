// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:technozia/constants/error_handling.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/team_member.dart';
import 'package:technozia/models/user.dart';
import 'package:technozia/providers/team_members_provider.dart';

import '../providers/user_provider.dart';

class ParticipantServices {
  Future<void> addTeamMember({
    required BuildContext context,
    required String fullName,
    required String email,
    required int phoneNo,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      TeamMember teamMember = TeamMember(
        id: "",
        leader: user.id,
        fullName: fullName,
        college: user.college,
        phoneNo: phoneNo,
        email: email,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-teamMember'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
        body: teamMember.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      print("vansh132" + e.toString());
    }
  }

  Future<List<TeamMember>> fetchAllTeamMembers(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<TeamMember> teamMembersList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/teamMembers"),
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
            teamMembersList.add(
              TeamMember.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    print("vansh132" + teamMembersList.toString());
    return teamMembersList;
  }

  void updateTeamMember({
    required BuildContext context,
    required String id,
    required String fullName,
    required int phoneNo,
    required String email,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final userData = {
      "_id": id,
      "leader": user.id,
      "fullName": fullName,
      "phoneNo": phoneNo,
      "email": email
    };
    
    try {
      http.Response res = await http.post(Uri.parse("$uri/update/team-member"),
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
          print(res.body);
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
