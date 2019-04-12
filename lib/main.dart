import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletguard/redux/middleware/auth_middleware.dart';
import 'package:walletguard/redux/store/app_state.dart';
import 'package:walletguard/screens/dashboard/dashboard.dart';
import 'package:walletguard/screens/landing/landing.dart';
import 'package:walletguard/theme.dart';
import 'redux/reducers/app_state_reducer.dart';
import './routes.dart';

Future<bool> checkIsLoggedIn() async {
  var loggedIn = false;
  // If token exist already, then HomePage
  SharedPreferences prefs = await SharedPreferences.getInstance();
  loggedIn = prefs.getBool("loggedIn");

  print('user is logged: ' + loggedIn.toString());
  return loggedIn ?? false;
}

void main() async {
  var loggedIn = await checkIsLoggedIn();
  runApp(MainApp(loggedIn));
}

class MainApp extends StatelessWidget {
  bool loggedIn;

  MainApp(this.loggedIn);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(appStateReducer,
        initialState: AppState.initialState(),
        middleware: []..addAll(createAuthMiddleware()));

    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            theme: themeData,
            routes: getRoutes(store),
            home: loggedIn ? Dashboard() : Landing()));
  }
}
