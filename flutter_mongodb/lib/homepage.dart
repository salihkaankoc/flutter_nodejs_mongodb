import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userMail;
  void checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userMail = prefs.getString('usermail');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hoş geldin, $userMail'),
      ),
    );
  }
}
