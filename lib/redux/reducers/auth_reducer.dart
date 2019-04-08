import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/actions/auth_actions.dart';

final authReducer = combineReducers<FirebaseUser>([
  new TypedReducer<FirebaseUser, LogInSuccessful>(_logIn),
  new TypedReducer<FirebaseUser, LogOutSuccessful>(_logOut),
]);

FirebaseUser _logIn(FirebaseUser user, action) {
  print("login reducer");
  return action.user;
}

Null _logOut(FirebaseUser user, action) {
  return null;
}
