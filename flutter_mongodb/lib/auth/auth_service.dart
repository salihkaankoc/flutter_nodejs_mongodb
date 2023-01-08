import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mongodb/commons/error_handler.dart';
import 'package:flutter_mongodb/commons/global_variables.dart';
import 'package:flutter_mongodb/commons/my_snackbar.dart';
import 'package:flutter_mongodb/homepage.dart';
import 'package:flutter_mongodb/models/user.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      User user = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Kayıt Başarılı!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('usermail', jsonDecode(res.body)['email']);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
