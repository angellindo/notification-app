import 'package:walletguard/redux/store/app_state.dart';
import './auth_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      isLoading: false,
      currentUser: authReducer(state.currentUser, action));
}
