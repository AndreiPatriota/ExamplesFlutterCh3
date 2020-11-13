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

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text('Flutter App'),
        ),
      ),
      body: Center(
        child: Text(
          'Hello World from the Moon.',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('Hello little fellow!!');
        },
        tooltip: 'Greetings',
        child: Icon(Icons.add),
      ),
    );

}