import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/middleware/auth_middleware.dart';
import 'package:walletguard/redux/store/app_state.dart';
import 'package:walletguard/theme.dart';
import 'redux/reducers/app_state_reducer.dart';
import './routes.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(appStateReducer,
        initialState: AppState.initialState(),
        middleware: []..addAll(createAuthMiddleware()));

    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          theme: themeData,
          routes: getRoutes(context, store),
          initialRoute: '/',
        ));
  }
}
