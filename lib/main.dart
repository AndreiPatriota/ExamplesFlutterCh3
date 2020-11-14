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

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State{

  var _color = Colors.green;
  var _fontSize = 20.0;
  var _btnLabel = 'Push Me!';
  var _btnPushed = false;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedDefaultTextStyle(
                  child: Text('Text to be changed'),
                  style: TextStyle(color: _color, fontSize: _fontSize),
                  duration: const Duration(seconds: 2)
              ),
              RaisedButton(
                onPressed: (){
                  if(!_btnPushed){
                    _color = Theme.of(context).primaryTextTheme.title.color;
                    _fontSize = 40.0;
                    _btnLabel = 'Unpush me!';
                    _btnPushed = true;
                  }
                  else{
                    _color = Colors.green;
                    _fontSize = 20.0;
                    _btnLabel = 'Push Me!';
                    _btnPushed = false;
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