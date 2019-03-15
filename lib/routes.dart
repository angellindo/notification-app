import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/home.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      home: new Home(),
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => new Login()
      },
    ));
  }
}
