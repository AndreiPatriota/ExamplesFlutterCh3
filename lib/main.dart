import 'package:flutter/material.dart';

void main() {
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

  var _currentStep = 0;
  final _listOfSteps = [
    Step(
      title: Text('Get Ready'),
      isActive: true,
      content: Text('Let us begin..')
    ),
    Step(
        title: Text('Get Set'),
        isActive: false,
        content: Text('Ok, just a little more...')
    ),
    Step(
        title: Text('Go!'),
        isActive: true,
        content: Text("And, we're done")
    )
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Stepper Demo.',
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is a Stepper Widget Demo!'),
        ),
        body : Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: _currentStep < 2  ? () => setState((){_currentStep+=1;}): null,
          onStepCancel: _currentStep > 0 ?() => setState((){_currentStep-=1;}):null,
          steps: _listOfSteps,
        )
      ),
    );
  }
}