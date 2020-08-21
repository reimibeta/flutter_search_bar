import 'package:flutter/material.dart';

class Child extends StatelessWidget {
  final Widget child;
  Child({this.child});
  @override
  Widget build(BuildContext context) {
    return this.child ?? Container();
  }
}
