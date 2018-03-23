import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator App',
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State createState() => new CalcState();
}

class CalcState extends State<Calculator> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doMul() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doSub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  void doClear() {
    setState(() {
      num1 = 0;
      num2 = 0;
      sum = 0;
      t1.text = "0";
      t2.text = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Output : $sum",
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: "Enter Number 1"),
                controller: t1,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: "Enter Number 2"),
                controller: t2,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("+"),
                    color: Colors.greenAccent,
                    onPressed: doAddition,
                  ),
                  new MaterialButton(
                    child: new Text("-"),
                    color: Colors.greenAccent,
                    onPressed: doSub,
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("*"),
                    color: Colors.greenAccent,
                    onPressed: doMul,
                  ),
                  new MaterialButton(
                    child: new Text("/"),
                    color: Colors.greenAccent,
                    onPressed: doDiv,
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("Clear"),
                    color: Colors.greenAccent,
                    onPressed: doClear,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
