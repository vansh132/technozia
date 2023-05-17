import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:technozia/constants/error_handling.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/models/duoRegistration.dart';
import 'package:technozia/providers/user_provider.dart';

class RegistrationServices {
  Future<void> duoEventregistration({
    required BuildContext context,
    required String participantOne,
    required String participantTwo,
    required int phoneNo,
    required String email,
    required String eventName,
    required String paymentMode,
    required String paymentId,
    required String date,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      DuoRegistration duoRegistration = DuoRegistration(
        leader: user.id,
        participantOne: participantOne,
        participantTwo: participantTwo,
        phoneNo: phoneNo,
        email: email,
        eventName: eventName,
        paymentMode: paymentMode,
        paymentId: paymentId,
        date: date,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/register'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
        body: duoRegistration.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Payment Successfull');
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      print("vansh132" + e.toString());
    }
  }
}
