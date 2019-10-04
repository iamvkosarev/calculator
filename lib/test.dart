import "package:flutter/material.dart";
import 'dart:math';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'MainFont',
      ),
      home: new MyHomePage(title: 'Калькулятор'),
    );
  }

}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String output_symbol = "";
  Color color_1 = Colors.black38;
  Color color_2 = Colors.amberAccent;
  Color color_3 = Colors.black54;
  Color color_4 = Colors.black45;

  buttonPressed(String buttonText){
    if(buttonText == "Clear"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      output_symbol = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText =="/" || buttonText =="x" || buttonText == "^") {
      num1 = double.parse(output);
      operand = buttonText;
      output_symbol = buttonText;
      _output = "0";
    } else if (buttonText == "."){
      if (_output.contains(".")){
        print("Already contains a decimals");
        return;
      } else{
        _output += buttonText;
      }
    } else if (buttonText == "="){
      output_symbol = "";
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      } else if(operand == "-"){
        _output = (num1 - num2).toString();
      } else if(operand == "/"){
        _output = (num1 / num2).toString();
      } else if(operand == "x"){
        _output = (num1 * num2).toString();
      } else if(operand == "^"){
        _output = (pow(num1,num2)).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else{
      _output += buttonText;
    }
    print(_output);
    setState(() {
      if(_output.contains('.')){
        if(_output.length - 1 - _output.indexOf('.') <= 6){
          output = double.parse(_output).toStringAsFixed(_output.length - 1 - _output.indexOf('.'));
        } else{
          output = double.parse(_output).toStringAsFixed(6);
        }
      } else{
        output = double.parse(_output).toStringAsFixed(0);
      }
    });
  }

  Widget buildButton(String buttonText, Color color, Color fontColor){
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(10.0),
        child: new Text(buttonText,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText),
        color: color,
        textColor: fontColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
      new Container(
          child: PageView(
            children: <Widget>[
              Container(
                color: Colors.pink,

              ),
              Container(
                color: Colors.cyan,
              ),
              Container(
                color: Colors.deepPurple,
              ),
            ],
          ),

      ),
    );
  }

}
