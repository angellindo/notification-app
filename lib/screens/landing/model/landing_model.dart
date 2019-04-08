import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:walletguard/redux/actions/auth_actions.dart';
import 'package:walletguard/redux/store/app_state.dart';

class LandingViewModel {
  final FirebaseUser currentUser;
  final Function() onLogin;

  LandingViewModel({this.currentUser, this.onLogin});

  factory LandingViewModel.create(Store<AppState> store) {
    _onLogin() {
      store.dispatch(LogIn());
    }

    return LandingViewModel(
      currentUser: store.state.currentUser,
      onLogin: _onLogin
    );
  }
}
