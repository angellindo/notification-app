import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/actions/auth_actions.dart';

class Loading extends StatelessWidget {
  final Store store;

  Loading(this.store);

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.currentUser().then((user) {
    //   if (user != null) {
    //     store.dispatch(LogInSuccessful(user: user));
    //     Navigator.pushNamed(context, '/landing');
    //   } else {
    //     Navigator.pushNamed(context, '/landing');
    //   }
    // });
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
        ],
      ),
    ));
  }
}
