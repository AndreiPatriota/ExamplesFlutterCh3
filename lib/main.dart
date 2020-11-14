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

  var _showFirst = true;
  var _btnLabel = 'Do me!';

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                firstChild: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 100.0,
                ),
                secondChild: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100.0,
                ),
                crossFadeState: _showFirst?
                  CrossFadeState.showFirst:
                  CrossFadeState.showSecond,
                duration: const Duration(seconds: 2)
              ),
              RaisedButton(
                onPressed: (){
                  _showFirst = !_showFirst;
                  _btnLabel = _showFirst ?'Do me':'Undo me!';
                  setState(() {});
                },
                child: Text(_btnLabel),
              )
            ],
          ),
        ),
      );

}