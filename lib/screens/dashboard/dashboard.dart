import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/actions/auth_actions.dart';
import 'package:walletguard/redux/store/app_state.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
            body: Center(
              child: RaisedButton(
                onPressed: () {
                  vm.onLogOut(Navigator.of(context));
                },
                child: Text("Logout"),
              ),
            ),
          );
        });
  }
}

class _ViewModel {
  final FirebaseUser currentUser;
  final Function(NavigatorState) onLogOut;

  _ViewModel({this.currentUser, this.onLogOut});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogOut(NavigatorState navigator) {
      store.dispatch(LogOut(navigator));
    }

    return _ViewModel(
      currentUser: store.state.currentUser,
      onLogOut: _onLogOut
    );
  }
}
