import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final Widget child;

  SignUp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
