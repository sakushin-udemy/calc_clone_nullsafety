import 'package:flutter/material.dart';

import '../constants.dart';
import 'button.dart';

class KeyPad extends StatelessWidget {
  final FunctionOnPressed? onPressed;
  KeyPad(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('C', colorFunc, colorMain, onPressed),
            Button('+/-', colorFunc, colorMain, onPressed),
            Button('%', colorFunc, colorMain, onPressed),
            Button('/', colorCalc, colorText, onPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('7', colorNum, colorText, onPressed),
            Button('8', colorNum, colorText, onPressed),
            Button('9', colorNum, colorText, onPressed),
            Button('x', colorCalc, colorText, onPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('4', colorNum, colorText, onPressed),
            Button('5', colorNum, colorText, onPressed),
            Button('6', colorNum, colorText, onPressed),
            Button('-', colorCalc, colorText, onPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('1', colorNum, colorText, onPressed),
            Button('2', colorNum, colorText, onPressed),
            Button('3', colorNum, colorText, onPressed),
            Button('+', colorCalc, colorText, onPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('0', colorNum, colorText, onPressed),
            Button('.', colorNum, colorText, onPressed),
            Button('=', colorCalc, colorText, onPressed),
          ],
        ),
      ],
    );
  }
}
