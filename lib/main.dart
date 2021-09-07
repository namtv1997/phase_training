import 'package:flutter/material.dart';
import 'package:phase1_example/constant.dart';
import 'package:phase1_example/default_button.dart';
import 'package:phase1_example/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MyHomePage(title: 'Flutter Demo Home Page'),
    // );
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String genderName = '';
  bool isShowResult = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier! * 6,
                  top: SizeConfig.widthMultiplier! * 6,
                  bottom: SizeConfig.widthMultiplier! * 3),
              child: Text(
                "Nhập tên",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(
                  left: SizeConfig.heightMultiplier! * 2,
                  right: SizeConfig.heightMultiplier! * 2),
              height: SizeConfig.heightMultiplier! * 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: kTextColor, // set border color
                    width: 1),
              ),
              child: Container(
                margin: EdgeInsets.all(SizeConfig.widthMultiplier! * 3),
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier! * 2,
                          vertical: 10,
                        ))),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier! * 6,
                  top: SizeConfig.widthMultiplier! * 6,
                  bottom: SizeConfig.widthMultiplier! * 3),
              child: Text(
                "Nhập tuổi",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(
                  left: SizeConfig.heightMultiplier! * 2,
                  right: SizeConfig.heightMultiplier! * 2),
              height: SizeConfig.heightMultiplier! * 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: kTextColor, // set border color
                    width: 1),
              ),
              child: Container(
                margin: EdgeInsets.all(SizeConfig.widthMultiplier! * 3),
                child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier! * 2,
                          vertical: 10,
                        ))),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier! * 6,
                  top: SizeConfig.widthMultiplier! * 6,
                  bottom: SizeConfig.widthMultiplier! * 3),
              child: Text(
                "Nhập địa chỉ",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(
                  left: SizeConfig.heightMultiplier! * 2,
                  right: SizeConfig.heightMultiplier! * 2),
              height: SizeConfig.heightMultiplier! * 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: kTextColor, // set border color
                    width: 1),
              ),
              child: Container(
                margin: EdgeInsets.all(SizeConfig.widthMultiplier! * 3),
                child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier! * 2,
                          vertical: 10,
                        ))),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier! * 6,
                  top: SizeConfig.widthMultiplier! * 6,
                  bottom: SizeConfig.widthMultiplier! * 3),
              child: Text(
                "Giới tính",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(
                  left: SizeConfig.heightMultiplier! * 2,
                  right: SizeConfig.heightMultiplier! * 2),
              height: SizeConfig.heightMultiplier! * 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: kTextColor, // set border color
                    width: 1),
              ),
              child: Container(
                margin: EdgeInsets.all(SizeConfig.widthMultiplier! * 3),
                child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                child: Container(
                                    color: Colors.white,
                                    height: SizeConfig.heightMultiplier! * 40,
                                    width: double.infinity,
                                    child: Column(children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                          "Chọn giới tính",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.only(
                                            left: SizeConfig.heightMultiplier! *
                                                2,
                                            right:
                                                SizeConfig.heightMultiplier! *
                                                    2,
                                            top: SizeConfig.heightMultiplier! *
                                                2),
                                        height:
                                            SizeConfig.heightMultiplier! * 6,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: kTextColor,
                                              // set border color
                                              width: 1),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              genderName = "Nam";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(
                                                SizeConfig.widthMultiplier! *
                                                    3),
                                            child: Text("Nam",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.only(
                                            left: SizeConfig.heightMultiplier! *
                                                2,
                                            right:
                                                SizeConfig.heightMultiplier! *
                                                    2,
                                            top: SizeConfig.heightMultiplier! *
                                                2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: kTextColor,
                                              // set border color
                                              width: 1),
                                        ),
                                        height:
                                            SizeConfig.heightMultiplier! * 6,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              genderName = "Nữ";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(
                                                SizeConfig.widthMultiplier! *
                                                    3),
                                            child: Text("Nữ",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.only(
                                            left: SizeConfig.heightMultiplier! *
                                                2,
                                            right:
                                                SizeConfig.heightMultiplier! *
                                                    2,
                                            top: SizeConfig.heightMultiplier! *
                                                2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: kTextColor,
                                              // set border color
                                              width: 1),
                                        ),
                                        height:
                                            SizeConfig.heightMultiplier! * 6,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              genderName = "Khác";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(
                                                SizeConfig.widthMultiplier! *
                                                    3),
                                            child: Text("Khác",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                    ])));
                          });
                    },
                    child: Text(
                      genderName,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(2),
              height: SizeConfig.heightMultiplier! * 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(SizeConfig.heightMultiplier! * 2),
                    child: DefaultButton(
                      press: () {
                        setState(() {
                          isShowResult = true;
                        });
                      },
                      text: 'Confirm',
                      color: kOrange,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(SizeConfig.heightMultiplier! * 2),
                    child: DefaultButton(
                      press: () {
                        FocusScope.of(context).unfocus();

                        nameController.clear();
                        ageController.clear();
                        addressController.clear();

                        setState(() {
                          genderName = "";
                          isShowResult = false;
                        });

                        print("Tên: ${nameController.text},Tuổi: ${ageController.text}, Địa chỉ: ${addressController.text}, Giới tính: ${genderName}");
                      },
                      text: 'Delete',
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              child: Text("Tên: ${nameController.text},Tuổi: ${ageController.text}, Địa chỉ: ${addressController.text}, Giới tính: ${genderName}"),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: isShowResult,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
