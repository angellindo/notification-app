import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/screens/landing/landing.dart';
import './screens/login/login.dart';
import './screens/sign_up.dart';
import './screens/loading.dart';
import './screens/dashboard/dashboard.dart';

Map<String, WidgetBuilder> getRoutes(Store store) {
  return {
    '/landing': (BuildContext context) => Landing(),
    '/login': (BuildContext context) => Login(),
    '/signup': (BuildContext context) => SignUp(),
    '/dashboard': (BuildContext context) => Dashboard()
  };
}
