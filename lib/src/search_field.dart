//import 'package:flutter/material.dart';
//
//// ignore: must_be_immutable
//class SearchField extends StatefulWidget {
//  final String hint;
//  final Function onTap;
//  final Widget leading;
//  final List<Widget> actions;
//  final Color backgroundColor;
//  final Color bodyColor;
//  final Widget child;
//  final double space;
//  SearchField({
//    Key key,
//    this.hint,
//    this.onTap,
//    this.leading,
//    this.backgroundColor,
//    this.actions,
//    this.child,
//    this.bodyColor,
//    this.space,
//  }) : super(key : key);
//  @override
//  _SearchFieldState createState() => _SearchFieldState();
//}
//
//class _SearchFieldState extends State<SearchField> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: this.widget.bodyColor == null ? Colors.white : this.widget.bodyColor,
//      appBar: AppBar(
//        leading: this.widget.leading,
//        automaticallyImplyLeading: this.widget.leading == null ? false : true,
//        backgroundColor: this.widget.backgroundColor == null ? Colors.white : widget.backgroundColor,
//        titleSpacing: widget.space == null ? 10.0 : widget.space,
//        title: Container(
//          width: MediaQuery.of(context).size.width,
//          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
//          height: 40,
//          decoration: new BoxDecoration(
//            shape: BoxShape.rectangle,
//            color: Colors.grey.shade200,
//            border: new Border.all(
//              color: Colors.grey.shade200,
//              width: 0.5,
//            ),
//          ),
//          child: InkWell(
//            child: Padding(
//              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//              child: Text("Search",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                  color: Colors.grey.shade800,
//                  fontSize: 16,
//                ),
//              ),
//            ),
//            onTap: () => widget.onTap(),
//          ),
//        ),
//        actions: widget.actions,
//      ),
//      body: this.widget.child,
//    );
//  }
//}
