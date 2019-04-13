import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) => print(text),
                decoration: InputDecoration(
                    hintText: 'Your email address'),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) => print(text),
                decoration: InputDecoration(
                    hintText: 'Your password'),
              ),
            ),
            SizedBox(width: 200,
            child: RaisedButton(
              onPressed: () => null,
              child: Text("Log In"),
            )
            )
          ],
        ),
      ),
    );
  }
}
