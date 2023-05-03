import 'package:flutter/material.dart';
import 'package:technozia/constants/error_handling.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/user.dart';
import 'package:http/http.dart' as http;

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
}
