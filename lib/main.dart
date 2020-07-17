import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Calculator ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum;
  int secondnum;
  int count = 0;
  String textToDispaly = "";
  String textToOperation = "";
  String input = "";
  String res;
  String operatorToPerform;

  void btnClicked(String btnVal) {
    if (count != 0) {
      res = "";
      count = 0;
      input = "";
      setState(() {
        textToDispaly = res;
        textToOperation = input;
      });
    } //else {
    input = input + " " + btnVal;
    // }

    if (btnVal == "C") {
      textToDispaly = "";
      textToOperation = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
      input = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      firstnum = int.parse(textToDispaly);
      res = "";
      operatorToPerform = btnVal;
    } else if (btnVal == "=") {
      count++;
      secondnum = int.parse(textToDispaly);
      if (operatorToPerform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatorToPerform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatorToPerform == "*") {
        res = (firstnum * secondnum).toString();
      }
      if (operatorToPerform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(textToDispaly + btnVal).toString();
    }

    setState(() {
      textToDispaly = res;
      textToOperation = input;
    });
  }

  Widget customButton(String btnValue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => btnClicked(btnValue),
      child: Text(
        "$btnValue",
        style: TextStyle(fontSize: 70.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text("$textToOperation",
                  style:
                      TextStyle(fontSize: 50.0, fontWeight: FontWeight.w600)),
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text("$textToDispaly",
                  style:
                      TextStyle(fontSize: 50.0, fontWeight: FontWeight.w600)),
            )),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
