import 'package:flutter/material.dart';

void main(){
  runApp(App());
}

class App extends StatefulWidget{
  App({Key key}) : super(key: key);

  @override
  AppState createState(){
    return AppState();
  }
}

class AppState extends State{
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _checkBoxValue = false;
  var _switchValue = false;
  var _sliderValue = .3;
  var _radioValue = 1;

  List get listOfFields => <Widget>[
    Checkbox(
        value: _checkBoxValue,
        onChanged: (bool inVal){
          setState(() {
            _checkBoxValue = inVal;
          });
        }
    ),
    Switch(
        value: _switchValue,
        onChanged: (bool inVal){
          setState(() {
            _switchValue = inVal;
          });
        }
    ),
    Row(
      children: [
        Slider(
            min: 0,
            max: 20,
            value: _sliderValue,
            onChanged: (num inValue){
              setState(() {
                _sliderValue = inValue;
              });
            }
        ),
        Text(_sliderValue.toStringAsFixed(2))
      ],
    ),
    Row(
      children: [
        Radio(
            value: 1,
            groupValue: _radioValue,
            onChanged: (num inVal){
              setState(() {
                _radioValue = inVal;
              });
            }
        ),
        Text('Option 1')
      ],
    ),
    Row(
      children: [
        Radio(
            value: 2,
            groupValue: _radioValue,
            onChanged: (num inVal){
              setState(() {
                _radioValue = inVal;
              });
            }
        ),
        Text('Option 2')
      ],
    ),
    Row(
      children: [
        Radio(
            value: 3,
            groupValue: _radioValue,
            onChanged: (num inVal){
              setState(() {
                _radioValue = inVal;
              });
            }
        ),
        Text('Option 2')
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My newest App',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: listOfFields,
            ),
          ),
        ),
      )
    );
  }

}

