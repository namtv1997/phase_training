import 'package:flutter/material.dart';
import 'package:phase1_example/constant.dart';
import 'package:phase1_example/default_button.dart';
import 'package:phase1_example/main/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../size_config.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "";
  String passWord = "";

  Future<String> getName(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString(key) ?? "";
    });

    return userName;
  }

  Future<String> getPassWord(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      passWord = prefs.getString(key) ?? "";
    });

    return passWord;
  }

  Future<void> _clearAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  void initState() {
    getName('userName');
    getPassWord('passWord');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Home"),
        ),
        body: Column(
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.red),
                children: [
                  TextSpan(
                      text: "Tài khoản: ${userName}\n",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  TextSpan(
                    text: "Mật khẩu : ${passWord}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(SizeConfig.heightMultiplier! * 2),
              child: DefaultButton(
                press: () {
                  _clearAllData();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(title: 'Login Demo')),
                      (Route<dynamic> route) => false);
                },
                text: 'Logout',
                color: kPrimaryColor,
              ),
            ),
          ],
        ));
  }
}
