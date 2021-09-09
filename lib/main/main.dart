import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phase1_example/constant.dart';
import 'package:phase1_example/default_button.dart';
import 'package:phase1_example/home/home.dart';
import 'package:phase1_example/size_config.dart';
import 'package:phase1_example/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                inputDecorationTheme: inputDecorationTheme(),
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(title: 'Login Demo'),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String error = "";
  String userName = "";
  String passWord = "";

  bool isShowError = false;

  final formKey = GlobalKey<FormState>();

  Future<bool> setName(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  Future<bool> setPassWord(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  Future<String> getName(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString(key)!;
    });

    if (userName.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    }
    return userName;
  }

  void _validateInfor() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      setName('userName', userName);
      setPassWord('passWord', passWord);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    } else {
      print("loi");
    }
  }

  @override
  void initState() {
    super.initState();
    getName('userName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.heightMultiplier! * 5),
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier! * 6,
                    top: SizeConfig.widthMultiplier! * 6,
                    bottom: SizeConfig.widthMultiplier! * 3),
                child: Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier! * 10),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: SizeConfig.heightMultiplier! * 2,
                    right: SizeConfig.heightMultiplier! * 2),
                child: TextFormField(
                    obscureText: false,
                    validator: (value) => value!.isEmpty
                        ? "Hãy nhập đủ thông tin cần thiết"
                        : null,
                    onSaved: (value) => setState(() => userName = value!),
                    decoration: InputDecoration(
                        hintText: "Nhập tài khoản",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(
                            SizeConfig.heightMultiplier! * 1.6))),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier! * 6,
                    top: SizeConfig.widthMultiplier! * 3,
                    bottom: SizeConfig.widthMultiplier! * 3),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: SizeConfig.heightMultiplier! * 2,
                    right: SizeConfig.heightMultiplier! * 2),
                child: TextFormField(
                    obscureText: true,
                    validator: (value) => value!.isEmpty
                        ? "Hãy nhập đủ thông tin cần thiết"
                        : null,
                    onSaved: (value) => setState(() => passWord = value!),
                    decoration: InputDecoration(
                        hintText: "Nhập mật khẩu",
                        contentPadding: EdgeInsets.all(
                            SizeConfig.heightMultiplier! * 1.6))),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(SizeConfig.heightMultiplier! * 2),
                child: DefaultButton(
                  press: () async {
                    _validateInfor();
                  },
                  text: 'Confirm',
                  color: kOrange,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
