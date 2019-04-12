import 'package:firebase_auth/firebase_auth.dart';

class AppState {
  bool isLoading;
  FirebaseUser currentUser;

  AppState({
    this.isLoading = false,
    this.currentUser,
  });

  AppState.initialState()
      : isLoading = true,
        currentUser = null;

  AppState copyWith({bool isLoading}) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, currentUser: $currentUser}';
  }
}
