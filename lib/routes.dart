import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/home.dart';
import './theme.dart';

class Routes {
  Routes() {
    runApp(MaterialApp(
      theme: themeData,
      home: Home(),
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => new Login()
      },
    ));
  }
}
