import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  final _listOfWidgets = [
    SizedBox(
      width: 350,
      height: 500,
      child: Card(
        color: Colors.blueGrey[500],
        child: Align(
          alignment: Alignment.center,
          child: Text('Announcements',
            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 26),),
        ),
      ),
    ),
    SizedBox(
      width: 350,
      height: 500,
      child: Align(
        alignment: Alignment.center,
        child: Text('Birthdays',
          style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 26),),
      ),
    ),
    SizedBox(
      width: 350,
      height: 500,
      child: Card(
        color: Colors.blueGrey[500],
        child: Align(
          alignment: Alignment.center,
          child: Text('Data',
            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 26),),
        ),
      ),
    )
  ];
  final _listOfTabs = [
    Tab(icon: Icon(Icons.announcement),),
    Tab(icon: Icon(Icons.cake),),
    Tab(icon: Icon(Icons.cloud),)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Newest App.',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text('This is my newest Flutter App.'),
            bottom: TabBar(
              tabs: _listOfTabs,
            ),
          ),
          body: TabBarView(
            children: _listOfWidgets,
          ),
        ),
      ),
    );
  }
}
