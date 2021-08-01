import 'package:flutter/material.dart';

import '../constants.dart';
import 'button.dart';

class KeyPad extends StatelessWidget {
  funcOnPress? onPress;
  KeyPad(this.onPress);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button("C", colorFunc, colorMain, onPress),
            Button("+/-", colorFunc, colorMain, onPress),
            Button("%", colorFunc, colorMain, onPress),
            Button("/", colorCalc, colorText, onPress),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button("7", colorNum, colorText, onPress),
            Button("8", colorNum, colorText, onPress),
            Button("9", colorNum, colorText, onPress),
            Button("x", colorCalc, colorText, onPress),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button("4", colorNum, colorText, onPress),
            Button("5", colorNum, colorText, onPress),
            Button("6", colorNum, colorText, onPress),
            Button("-", colorCalc, colorText, onPress),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button("1", colorNum, colorText, onPress),
            Button("2", colorNum, colorText, onPress),
            Button("3", colorNum, colorText, onPress),
            Button("+", colorCalc, colorText, onPress),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button("0", colorNum, colorText, onPress),
            Button(".", colorNum, colorText, onPress),
            Button("=", colorCalc, colorText, onPress),
          ],
        ),
      ],
    );
  }
}
