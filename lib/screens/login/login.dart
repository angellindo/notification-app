import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Widget child;

  Login({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
