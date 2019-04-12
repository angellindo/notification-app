import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletguard/redux/actions/auth_actions.dart';
import 'package:walletguard/redux/store/app_state.dart';

List<Middleware<AppState>> createAuthMiddleware() {
  final logIn = _createLogInMiddleware();
  final status = _createCheckAuthMiddleware();
  final logOut = _createLogOutMiddleware();

  return [
    TypedMiddleware<AppState, Status>(status),
    TypedMiddleware<AppState, LogIn>(logIn),
    TypedMiddleware<AppState, LogOut>(logOut)
  ];
}

Middleware<AppState> _createLogInMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    FirebaseUser user;
    final _auth = FirebaseAuth.instance;
    final _googleSignIn = GoogleSignIn();

    if (action is LogIn) {
      try {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        user = await _auth.signInWithCredential(credential);
        print('Logged in ${user.displayName}');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("loggedIn", true);

        store.dispatch(LogInSuccessful(user: user));
        action.navigator.pushNamed("/dashboard");
      } catch (error) {
        store.dispatch(LogInFail(error));
      }
    }

    next(action);
  };
}

Middleware<AppState> _createLogOutMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    final _auth = FirebaseAuth.instance;
    if (action is LogOut) {
      try {
        await _auth.signOut();
        print('logging out...');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('loggedIn');

        store.dispatch(LogOutSuccessful());
        action.navigator.pushNamed("/landing");
      } catch (error) {
        store.dispatch(LogOutFail(error));
      }
    }

    next(action);
  };
}

Middleware<AppState> _createCheckAuthMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    final user = await FirebaseAuth.instance.currentUser();
    if (action is Status) {
      store.dispatch(LogInSuccessful(user: user));
    }

    next(action);
  };
}
