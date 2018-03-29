import 'package:flutter/material.dart';

//entry point
void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      theme: new ThemeData.dark(),
      home: new Calculator(),
    );
  }
}


//Create StatefulWidget for user interaction
class Calculator extends StatefulWidget {
  @override
  State createState() => new CalculatorState();
}

class CalculatorState extends State<Calculator> {
  var num1 = 0.0, num2 = 0.0, sum = 0.0, ans = 0.0;

  //controller for input text field
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();

  //add method
  void doAdd() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 + num2;
    });
  }

  //subtraction method
  void doSub() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 - num2;
    });
  }

  //multiplication method
  void doMul() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 * num2;
    });
  }

  //division method
  void doDiv() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 / num2;
    });
  }

  //clear all numbers and text fields
  void doClear() {
    setState(() {
      num1 = 0.0;
      num2 = 0.0;
      sum = 0.0;
      t1.clear();
      t2.clear();
    });
  }

  //save last result
  void doAns() {
    setState(() {
        ans = sum;
        if(ans != 0.0) {
         t1.text = "$ans";
        }
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
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output : $sum",
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.red,
                  onPressed: doAdd,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.red,
                  onPressed: doSub,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("*"),
                  color: Colors.red,
                  onPressed: doMul,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  color: Colors.red,
                  onPressed: doDiv,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.red,
                  onPressed: doClear,
                ),
                new MaterialButton(
                  child: new Text("Ans"),
                  color: Colors.red,
                  onPressed: doAns,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}