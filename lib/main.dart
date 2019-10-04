import "package:flutter/material.dart";
import 'dart:math';

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
      body: new Container(

          child: new Column(children: <Widget>[

            // Верхння панель
            new Container(
              margin: EdgeInsets.symmetric(),
              height: 75,
              width: 500,
              color: color_2,
              child: Align(
                alignment: Alignment(0.0, 0.75),
                child: new Text("Калькулятор", style:
                new TextStyle(
                  fontSize: 30.0,
                  color: color_4,
                ),
                ),
              ),
            ),
            // Верхняя линия
            new Container(
              margin: EdgeInsets.symmetric(),
              height: 5,
              width: 500,
              color: color_1,
            ),
            // Вводимые цифры
            new Container(
              padding: new EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 12.0,
              ),
              child: new Text(output, style:
              new TextStyle(
                fontSize: 40.0,
                color: color_3,
              ),
              ),
              alignment: Alignment.bottomRight,

            ),
            // Выбраный символ
            new Container(
              padding: new EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 12.0,
              ),
              child: new Text(output_symbol, style:
              new TextStyle(
                fontSize: 40.0,
                color: color_3,
              ),
              ),
              alignment: Alignment.bottomLeft,

            ),
            // Разделитель пространства
            new Expanded(child:
            new Divider(),
            ),
            // Кнопки
            //_buildPageView(),
            PageView(
              children: <Widget>[
                Container(),
              ],
            ),
            new Column(children: [

              new Row(children: [
                buildButton("7", color_2, color_1),
                buildButton("8", color_2, color_1),
                buildButton("9", color_2, color_1),
                buildButton("^", color_2, color_1),
              ]),

              new Row(children: [
                buildButton("4", color_2, color_1),
                buildButton("5", color_2, color_1),
                buildButton("6", color_2, color_1),
                buildButton("/", color_2, color_1),
              ]),

              new Row(children: [
                buildButton("1", color_2, color_1),
                buildButton("2", color_2, color_1),
                buildButton("3", color_2, color_1),
                buildButton("x", color_2, color_1),
              ]),

              new Row(children: [
                buildButton("+", color_2, color_1),
                buildButton("0", color_2, color_1),
                buildButton("-", color_2, color_1),
                buildButton(".", color_2, color_1),
              ]),

              new Row(children: [
                buildButton("Clear", color_1, color_2),
                buildButton("=", color_1, color_2)
              ],)
            ],)
          ],)
      ),
    );
  }

}
