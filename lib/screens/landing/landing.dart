import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/actions/auth_actions.dart';
import 'package:walletguard/redux/store/app_state.dart';
import 'package:walletguard/screens/landing/widget/google_auth_button.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel vm) {
          return this.widget(context, vm);
        });
  }

  widget(BuildContext context, _ViewModel vm) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        )
      ],
    )));
  }
}

class _ViewModel {
  final FirebaseUser currentUser;
  final Function(NavigatorState) onLogin;

  _ViewModel({this.currentUser, this.onLogin});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogin(NavigatorState navigator) {
      store.dispatch(LogIn(navigator));
    }

    var viewModel = _ViewModel(
      currentUser: store.state.currentUser,
      onLogin: _onLogin
    );
    return viewModel;
  }
}
