import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/store/app_state.dart';
import 'package:walletguard/screens/landing/model/landing_model.dart';
import 'package:walletguard/screens/landing/widget/google_auth_button.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LandingViewModel>(
        converter: (Store<AppState> store) => LandingViewModel.create(store),
        builder: (BuildContext context, LandingViewModel vm) =>
            this.widget(context, vm));
  }

  widget(BuildContext context, LandingViewModel vm) {
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
            child: GoogleAuthButton(vm.currentUser, vm.onLogin),
          ),
        ],
      ),
    ));
  }
}
