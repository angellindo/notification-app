import 'package:flutter/material.dart';
import '../widgets/font_awesome_icons.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 300,
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/login"),
              child: const Text('Login'),
            ),
          ),
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/signup"),
              child: const Text('Sign Up'),
            ),
          ),
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Icon(FontAwesome.google),
                  ),
                  Text('Google')
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
