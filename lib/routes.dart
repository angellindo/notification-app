import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:walletguard/redux/store/app_state.dart';

import './screens/login/login.dart';
import './screens/sign_up.dart';
import './screens/landing/landing.dart';

Map<String, WidgetBuilder> getRoutes(context, store) {
  return {
    '/': (BuildContext context) => StoreBuilder<AppState>(
        builder: (context, store) => Landing()
    )
  };
}
