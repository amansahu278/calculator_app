import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Calculator"),
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
  String output = "0";
  String _output= "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String txt){
    if(txt == "CLEAR"){
      _output= "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else if(txt =="+" || txt == "-"|| txt=="*"||txt=="/"){
      num1 = double.parse(_output);
      operand = txt;
      _output = "0";
    }else if(txt==".") {
      if (_output.contains(".")) {
        print("Already contains a decimal point");
        return;
      } else {
        _output += txt;
      }
    }
      else if(txt=="="){

        num2 = double.parse(_output);

        if(operand == "+"){
          _output = (num1+num2).toString();
        }
        if(operand == "-"){
          _output = (num1-num2).toString();
        }
        if(operand == "*"){
          _output = (num1*num2).toString();
        }
        if(operand == "/"){
          _output = (num1/num2).toString();
        }
        num1 = 0;
        num2 = 0;
        operand="";
    }
    else{
        _output = _output + txt;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget buildButton(String txt) {
    return new Expanded(
      child: new Material(
        child: new RaisedButton(
          padding: new EdgeInsets.all(24),
          child: new Text(
            txt,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(txt),
          color: Colors.black38,
          textColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calculator',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30),),
        backgroundColor: Colors.black,
      ),
      body: new Container(

          child: new Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 17,
              horizontal: 12,
            ),
            child: new Text(
              output,
              style: new TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          new Expanded(child: new Divider()),
          new Column(children: [
            new Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ]),
            new Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*")
            ]),
            new Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ]),
            new Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+")
            ]),
            new Row(children: [
              buildButton("CLEAR"),
              buildButton("="),
            ]),
          ])
        ],
      )),
    );
  }
}
