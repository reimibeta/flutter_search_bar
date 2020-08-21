import 'package:flutter/material.dart';

class Leading extends StatelessWidget {
  final Widget leading;
  Leading({this.leading});
  @override
  Widget build(BuildContext context) {
    return this.leading ?? Container();
  }
}
