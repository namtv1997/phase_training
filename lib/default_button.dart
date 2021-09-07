
import 'package:flutter/material.dart';
import 'package:phase1_example/size_config.dart';

import 'constant.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.press, required this.color}) : super(key: key);
  final String text;
  final VoidCallback press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: SizeConfig.heightMultiplier! * 6,
      child: FlatButton(
          color: color,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Colors.white),
          )),
    );
  }
}