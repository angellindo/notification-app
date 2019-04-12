import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Status {}

class LogIn {
  final NavigatorState navigator;
  LogIn(this.navigator);
}

class LogInSuccessful {
  final FirebaseUser user;

  LogInSuccessful({@required this.user});

  @override
  String toString() {
    return 'LogIn{user: $user}';
  }
}

class LogInFail {
  final dynamic error;

  LogInFail(this.error);

  @override
  String toString() {
    return 'LogIn{There was an error loggin in: $error}';
  }
}

class LogOut {
  final NavigatorState navigator;
  LogOut(this.navigator);
}

class LogOutFail {
  final dynamic error;

  LogOutFail(this.error);

  @override
  String toString() {
    return '{There was an error logging out: $error}';
  }
}

class LogOutSuccessful {
  @override
  String toString() {
    return 'LogOut{user: null}';
  }
}
