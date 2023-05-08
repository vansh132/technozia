import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:technozia/constants/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext errContext,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(errContext, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(errContext, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(errContext, response.body);
  }
}
