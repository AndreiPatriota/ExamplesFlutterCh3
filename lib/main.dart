import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My app',
  home: MyApp(),
)
);

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final _listOfWidgets = [
      Container(height: 90,),
      Theme(
          data: ThemeData(
            accentColor: Colors.blue,
          ),
          child: Container(
            color: Theme.of(context).accentColor,
            child: Opacity(
              opacity: 0.25,
              child: Text(
                'Text with a background color',
                style: Theme.of(context).textTheme.title,
              ),
            )
          )
      ),
      Container(height: 80,),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF000000), Color(0xFFFF0000)],
            tileMode: TileMode.repeated
          )
        ),
        child: Container(
          width: 200,
          height: 200,
          child: Text(
            'Hello there. Zuko here',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      Container(height: 80,),
      Center(
        child: Container(
          color: Colors.indigo,
          child: Transform(
            alignment: Alignment.bottomLeft,
            transform: Matrix4.skewY(0.4)..rotateZ(-3/12.0),
            child: Container(
              padding: EdgeInsets.all(12.0),
              color: Colors.red,
              child: Text('I am from Itapetim!!'),
            ),
          ),
        ),
      )
    ];

    return Scaffold(
      body: Center(
        child: Column(
          children: _listOfWidgets,
        ),
      )
    );
  }
}