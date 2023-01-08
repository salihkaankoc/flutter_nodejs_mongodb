import 'package:flutter/material.dart';
import 'package:flutter_mongodb/commons/global_variables.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: GlobalVariables.myBlueColor,
      content: Text(text),
    ),
  );
}
