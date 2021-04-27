import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 色の定義
  static const Color colorMain = Colors.black;
  static const Color colorNum = Colors.white10;
  static const Color colorFunc = Colors.white54;
  static const Color colorCalc = Colors.orange;
  static const Color colorText = Colors.white;

  String txtResult = "0";

  static const Map<String, IconData> _mapIcon = {
    "+/-": CupertinoIcons.plus_slash_minus,
    "%": CupertinoIcons.percent,
    "/": CupertinoIcons.divide,
    "x": CupertinoIcons.multiply,
    "-": CupertinoIcons.minus,
    "+": CupertinoIcons.plus,
    "=": CupertinoIcons.equal,
  };

  int _counter = 0;

  Widget Button(String text, Color colorButton, Color colorText) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          child: Padding(
            padding: text == "0"
                ? const EdgeInsets.only(
                    left: 20, top: 20, right: 120, bottom: 20)
                : text.length == 1
                    ? const EdgeInsets.all(22)
                    : const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
            child: _mapIcon.containsKey(text)
                ? Icon(
                    _mapIcon[text],
                    size: 30,
                  )
                : Text(
                    text,
                    style: const TextStyle(fontSize: 30),
                  ),
          ),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: colorButton,
            onPrimary: colorText,
            shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
          ),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    txtResult,
                    style: const TextStyle(
                      color: colorText,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("C", colorFunc, colorMain),
                Button("+/-", colorFunc, colorMain),
                Button("%", colorFunc, colorMain),
                Button("/", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("7", colorNum, colorText),
                Button("8", colorNum, colorText),
                Button("9", colorNum, colorText),
                Button("x", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("4", colorNum, colorText),
                Button("5", colorNum, colorText),
                Button("6", colorNum, colorText),
                Button("-", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("1", colorNum, colorText),
                Button("2", colorNum, colorText),
                Button("3", colorNum, colorText),
                Button("+", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("0", colorNum, colorText),
                Button(".", colorNum, colorText),
                Button("=", colorCalc, colorText),
              ],
            ),
          ],
        ),
      ),
    );
  } // end of state class

}
