//import 'package:flutter/material.dart';
//
//// ignore: must_be_immutable
//class SearchFieldOpen extends StatefulWidget {
//  String hint;
//  Function onTap;
//  Widget leading;
//  List<Widget> actions;
//  Color backgroundColor;
//  Color bodyColor;
//  Widget body;
//  double space;
//  Drawer drawer;
//  BottomNavigationBar bottomNavigationBar;
//  SearchFieldOpen({
//    Key key,
//    this.hint,
//    this.onTap,
//    this.leading,
//    this.backgroundColor,
//    this.actions,
//    this.body,
//    this.bodyColor,
//    this.space,
//    this.drawer,
//    this.bottomNavigationBar,
//  }) : super(key : key);
//  @override
//  _SearchFieldOpenState createState() => _SearchFieldOpenState();
//}
//
//class _SearchFieldOpenState extends State<SearchFieldOpen> {
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: this.widget.bodyColor == null ? Colors.white : this.widget.bodyColor,
//        appBar: AppBar(
//          leading: this.widget.leading,
//          automaticallyImplyLeading: this.widget.leading == null ? false : true,
//          backgroundColor: this.widget.backgroundColor == null ? Colors.white : widget.backgroundColor,
//          titleSpacing: widget.space == null ? 10.0 : widget.space,
//          title: Container(
//            width: MediaQuery.of(context).size.width,
//            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
//            height: 40,
//            decoration: new BoxDecoration(
//              shape: BoxShape.rectangle,
//              color: Colors.grey.shade200,
//              border: new Border.all(
//                color: Colors.grey.shade200,
//                width: 0.5,
//              ),
//            ),
//            child: InkWell(
//              child: Padding(
//                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//                child: Text("Search",
//                  style: TextStyle(
//                    color: Colors.grey.shade600,
//                    fontSize: 16,
//                  ),
//                ),
//              ),
//              onTap: () => widget.onTap(),
//            ),
//          ),
//          actions: widget.actions,
//        ),
//        drawer: widget.drawer,
//        body: this.widget.body,
//        bottomNavigationBar: widget.bottomNavigationBar,
//      ),
//    );
//  }
//}
