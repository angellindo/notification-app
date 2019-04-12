import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walletguard/widgets/font_awesome_icons.dart';

class GoogleAuthButton extends StatelessWidget {
  final FirebaseUser currentUser;
  final Function onLogin;

  GoogleAuthButton(this.currentUser, this.onLogin, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        this.onLogin(Navigator.of(context));
      },
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
    );
  }
}
