import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My App',
  home: Scaffold(
    body: HomeApp(),
  ),
)
);



class HomeApp extends StatefulWidget{
  HomeApp({Key key}) : super(key: key);

  @override
  HomeAppState createState() => HomeAppState();
}

enum Food {Veggie, Barbecue, Brazilian, Italian}





class HomeAppState extends State{

  var _list = <String>['John Doe', 'Coffe'];
  var _chosenPet = 'No animals chosen';

  void _showSnackBar(BuildContext inContext){
    Scaffold.of(inContext).showSnackBar(
      SnackBar(
        content: Text('I like pongalll!!'),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 6),
        action: SnackBarAction(
          label: 'Enjoy',
          onPressed: (){
            print('Getting fat');
          },
        ),
      )
    );

  }

  _showBottomSheet(BuildContext inContext) {
    FlatButton btnDog = FlatButton(
        onPressed: () {
           _chosenPet = 'The chosen animal was a DOG.';
           Navigator.of(inContext).pop();
        },
        child: Text('Dog')
    );

    FlatButton btnCat = FlatButton(
        onPressed: () {
          _chosenPet = 'The chosen animal was a CAT.';
          Navigator.of(inContext).pop();
        },
        child: Text('Cat')
    );

    FlatButton btnParrot = FlatButton(
        onPressed: () {
          _chosenPet = 'The chosen animal was a PARROT.';
          Navigator.of(inContext).pop();
        },
        child: Text('Parrot')
    );

    showModalBottomSheet(
        context: inContext,
        builder: (BuildContext inContext){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('What is your favorite pet?'),
              btnDog,
              btnCat,
              btnParrot
            ],
          );
        }
    );
  }

  Future _showSimpleDialog(BuildContext inContext) async {
    switch(await showDialog(
        context: inContext,
        builder: (BuildContext oneContext){
          return SimpleDialog(
            title: Text('What is your favorite food?'),
            children: [
              SimpleDialogOption(
                child: Text('Veggie'),
                onPressed: (){
                  Navigator.pop(oneContext, Food.Veggie);
                },
              ),
              SimpleDialogOption(
                child: Text('Barbecue'),
                onPressed: (){
                  Navigator.pop(oneContext, Food.Barbecue);
                },
              ),
              SimpleDialogOption(
                child: Text('Brazilian'),
                onPressed: (){
                  Navigator.pop(oneContext, Food.Brazilian);
                },
              ),
              SimpleDialogOption(
                child: Text('Italian'),
                onPressed: (){
                  Navigator.pop(oneContext, Food.Italian);
                },
              )
            ],
          );
        }
    )){
      case Food.Veggie: _list = ['Veggies', 'Brocolli'];
      break;
      case Food.Barbecue : _list = ['Meat lovers','Steak'];
      break;
      case Food.Brazilian : _list = ['Brazilians','Beans plus Rice'];
      break;
      case Food.Italian : _list = ['Italians','Pizza'];
      break;

    }
  }

  @override
  Widget build(BuildContext thisContext) {

    _showAlertDialog(){
      FlatButton flatButton = FlatButton(
          onPressed: (){
            Navigator.of(thisContext).pop();
          },
          child: Text('Beam me up!!')
      );

      AlertDialog alertDialog = AlertDialog(
        title: Text('We come in peace'),
        content: Text('...shoor to kill..'),
        actions: [
          flatButton
        ],
      );

      showDialog(
          context: thisContext,
          barrierDismissible: false,
          builder: (BuildContext oneContext){
            return alertDialog;
          }
      );
    }

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(height: 200,),
            RaisedButton(
              child: Text('Show Dialog'),
              onPressed: ()async{
                await _showSimpleDialog(thisContext);
                setState(() {});
              },
            ),
            Container(height: 50,),
            Text('The favorite food of ${_list[0]} is ${_list[1]}'),
            Container(height: 30,),
            RaisedButton(
              child: Text('Dont touch this'),
              onPressed: _showAlertDialog,
            ),
            Container(height: 30,),
            RaisedButton(
              onPressed: (){
                _showSnackBar(thisContext);
              },
              child: Text('Gimme a snack'),
            ),
            Container(height: 30,),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _showBottomSheet(thisContext);
                });
              },
              child: Text('Choose an Animal'),
            ),
            Text(_chosenPet)
          ],
        )
      ),
    );

  }
}