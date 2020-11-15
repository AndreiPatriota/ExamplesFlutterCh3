import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My app',
  home: MyApp(),
  theme: ThemeData(
    //primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    accentColor: Colors.yellowAccent,//Colors.black87,
    canvasColor: Colors.blueGrey[900],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey[200],
      textTheme: ButtonTextTheme.primary,
    ),
    brightness: Brightness.dark,
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.deepOrange,
        fontSize: 20.0
      )
    )
  ),
)
);

class MyApp extends StatefulWidget{
  MyApp({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

enum Starter{BULBASSAUR, CHAMENDER, SQUIRTLE}


class _MyApp extends State{

  Starter _starterPokemon;

  Future _showMessage(BuildContext someContext) async{
    await showDialog(
      context: someContext,
      builder: (BuildContext oneContext){
        var pokemon = _starterPokemon;
        String title;
        List<TextSpan> listOfDescriptions;

        switch(pokemon){
          case Starter.BULBASSAUR:  title = 'Bulbassaur, I choose you!';
                                    listOfDescriptions = <TextSpan>[
                                      TextSpan(text: 'Bulbasaur. It bears the seed of a plant on its back from birth. '
                                          'The seed slowly develops. Researchers are unsure whether to '
                                          'classify Bulbasaur as a plant or animal. Bulbasaur are extremely '
                                          'tough and very difficult to capture in the wild.')
                                    ];
                                    break;
          case Starter.CHAMENDER:   title = 'Charmander, I choose you!';
                                    listOfDescriptions = <TextSpan>[
                                      TextSpan(text:"Charmander, the Lizard Pokémon. "
                                          "Charmander's health can be gauged by the fire on the tip of its "
                                          "tail, which burns intensely when it's in good health.")
                                    ];
                                    break;
          case Starter.SQUIRTLE:    title = 'Squirttle, I choose you!';
                                    listOfDescriptions = <TextSpan>[
                                      TextSpan(text: "Squirtle. This Tiny Turtle Pokémon draws its long "
                                          "neck into its shell to launch incredible water attacks "
                                          "with amazing range and accuracy. The blasts can be quite powerful.")
                                    ];
                                    break;
        }

        return SimpleDialog(
          title: Text(title),
          children: [
            RichText(
              text: TextSpan(
                children: listOfDescriptions
              ),
            ),
            RaisedButton(
              onPressed: (){Navigator.of(oneContext).pop();},
              child: Text('OK'),
                )
          ],

        );
      }
    );
  }

  @override
  Widget build(BuildContext thisContext) =>
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DragTarget(
                builder: (BuildContext someContext,
                          List<Starter> inComing,
                          List<dynamic> rejected) =>
                          Container(width: 200.0,height: 200.0,
                              color: Theme.of(context).primaryColor
                          ),
                onAccept: (someData){
                  switch(someData){
                    case Starter.BULBASSAUR: _starterPokemon = Starter.BULBASSAUR;
                                              _showMessage(thisContext);
                                              break;
                    case Starter.CHAMENDER: _starterPokemon = Starter.CHAMENDER;
                                            _showMessage(thisContext);
                                            break;
                    case Starter.SQUIRTLE:  _starterPokemon = Starter.SQUIRTLE;
                                            _showMessage(thisContext);
                                            break;
                  }
                },
              ),
              Container(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Draggable(
                      data: Starter.BULBASSAUR,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.green,
                      ),
                      feedback: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.greenAccent,
                      )
                  ),
                  Container(width: 30,),
                  Draggable(
                      data: Starter.CHAMENDER,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.red,
                      ),
                      feedback: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.redAccent,
                      )
                  ),
                  Container(width: 30,),
                  Draggable(
                      data: Starter.SQUIRTLE,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.blue,
                      ),
                      feedback: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.blueAccent,
                      )
                  ),
                ],
              ),
              Container(height: 30,),
              RaisedButton(
                onPressed: (){},
                child: Text('Henlo'),)
            ],
          ),
        ),
      );
}



