import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeApp(),
      ),
    );
  }
}

class HomeApp extends StatefulWidget{
  HomeApp({Key key}) : super(key: key);

  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State{

  var _list = <String>['John Doe', 'Coffe'];

  @override
  Widget build(BuildContext thisContext) {

    Future _showIt() async {
      switch(await showDialog(
        context: thisContext,
        builder: (BuildContext oneContext){
          return SimpleDialog(
            title: Text('What is your favorite food?'),
            children: [
              SimpleDialogOption(
                child: Text('Veggie'),
                onPressed: (){
                  Navigator.pop(oneContext, "Veggie");
                },
              ),
              SimpleDialogOption(
                child: Text('Barbecue'),
                onPressed: (){
                  Navigator.pop(oneContext, "Barbecue");
                },
              ),
              SimpleDialogOption(
                child: Text('Brazilian'),
                onPressed: (){
                  Navigator.pop(oneContext, "Brazilian");
                },
              ),
              SimpleDialogOption(
                child: Text('Italian'),
                onPressed: (){
                  Navigator.pop(oneContext, "Italian");
                },
              )
            ],
          );
        }
      )){
        case 'Veggie': _list = ['Veggies', 'Brocolli'];
                       break;
        case 'Barbecue' : _list = ['Meat lovers','Steak'];
                          break;
        case 'Brazilian' : _list = ['Brazilians','Beans plus Rice'];
                           break;
        case 'Italian' : _list = ['Italians','Pizza'];
                         break;

      }
    }

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(height: 250,),
            RaisedButton(
              child: Text('Show Dialog'),
              onPressed: ()async{
                await _showIt();
                setState(() {});
              },
            ),
            Container(height: 50,),
            Text('The favorite food of ${_list[0]} is ${_list[1]}')
          ],
        )
      ),
    );

  }
}