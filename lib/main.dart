import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My app',
  home: MyApp(),
  theme: ThemeData(
    //primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    accentColor: Colors.black87,
    canvasColor: Colors.blueGrey[900],
    brightness: Brightness.dark,
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.deepOrange
      )
    )
  ),
)
);

class MyApp extends StatefulWidget{
  MyApp({Key key}) : super(key: key);

  _MyApp createState()=> _MyApp();
}

class _MyApp extends State{

  var _color = Colors.amber;
  var _height = 200.0;
  var _width = 200.0;
  var _hasBeenActivated = false;
  var _btnLabel = 'Animate me';

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                color: _color,
                width: _width,
                height: _height,
              ),
              Container(height: 50,),
              RaisedButton(
                onPressed: (){
                  if(!_hasBeenActivated){
                    _color = Colors.green;
                    _width = 400.0;
                    _height = 400.0;
                    _hasBeenActivated = true;
                    _btnLabel = 'Take me back!';
                  }
                  else{
                    _color = Colors.amber;
                    _width = 200.0;
                    _height = 200.0;
                    _hasBeenActivated = false;
                    _btnLabel = 'Animate me!';
                  }
                  setState(() {});
                },
                child: Text(_btnLabel),
              )
            ],
          ),
        ),
      );

}