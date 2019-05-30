import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String _userName;
  String _password;
  bool _accpeted = false;
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("FApp"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String data) => setState(() => _userName = data),
              decoration: InputDecoration(
                labelText: "Username",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (String data) => setState(() => _password = data),
              decoration: InputDecoration(
                labelText: "Password",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SwitchListTile(
              value: _accpeted,
              onChanged: (bool data) => setState(() => _accpeted = data),
              title: Text("Accept"),
            ),
            SizedBox(
              height: 14.0,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 160.0),
              child: Text(
                "Login",
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ));
}
