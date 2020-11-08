import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  AppState createState() {
    return AppState();
  }
}

class LoginData {
  String username = "";
  String password = "";
}

class AppState extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List get _listOfFields =>
      <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: (String inputStr) {
            if (inputStr.length == 0) {
              return "Please, enter a username";
            }
            return null;
          },
          onSaved: (String inputStr) {
            _loginData.username = inputStr;
          },
          decoration: InputDecoration(
              hintText: "john@doe.com",
              labelText: "Username (emMil address)"
          ),
        ),
        TextFormField(
          obscureText: true,
          validator: (String inputStr) {
            if (inputStr.length < 10 ||
                !inputStr.contains('@') ||
                !inputStr.contains('?')
            ) {
              return "Password must be at least 10 characters long";
            }
            return null;
          },
          onSaved: (String inputStr) {
            _loginData.password = inputStr;
          },
          decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password"
          ),
        ),
        RaisedButton(
          child: Text('Log In!'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              print("Username: ${_loginData.username}");
              print("Password: ${_loginData.password}");
            }
          },
        )
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Form Project',
      home: Scaffold(
          body: Container(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Column(
                children: _listOfFields,
              ),
            ),
          )
      ),
    );
  }

}