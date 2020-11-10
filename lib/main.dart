import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Home(),
    );
  }


}

class Home extends StatefulWidget{
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State{

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  
  Future<void> _selectDate(inContext) async{
    DateTime newSelectedDate = await showDatePicker(
        context: inContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2021)
    );

    _selectedDate = newSelectedDate != null ? newSelectedDate : _selectedDate;
  }

  Future<void> _selectTime(inContext) async{
    TimeOfDay newSelectedTime = await showTimePicker(
        context: inContext,
        initialTime: TimeOfDay.now()
    );

    _selectedTime = newSelectedTime != null ? newSelectedTime : _selectedTime;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        children: [
          Container(height: 50,),
          RaisedButton(
              child: Text('Date Picker', style: TextStyle(color: Colors.deepOrange, fontSize: 18),),
              onPressed: () async{
                await _selectDate(context);
                setState(() {});
              }),
          RaisedButton(
              child: Text('Time Picker', style: TextStyle(color: Colors.deepOrange, fontSize: 18),),
              onPressed: () async{
                await _selectTime(context);
                setState(() {});
              }),
          Container(height: 150,),
          Text(
              "Date Picked: " + _selectedDate?.day.toString() + "/" + _selectedDate?.month.toString() + "/" + _selectedDate?.year.toString(),
              style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 26),
          ),
          Text(
              "Time Picked: " + _selectedTime.hour.toString() + ":" + _selectedTime.minute.toString(),
              style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 26),
          )
        ],
      ),
    );
  }

}