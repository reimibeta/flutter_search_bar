import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {
  String hint;
  bool focus = false;
  TextEditingController controller;
  Function onChanged;
  Function onSubmitted;
  Function onClear;
  Function onTap;
  double radius;
  // search bar style
  Widget leading;
  List<Widget> actions;
  Color backgroundColor;
  Color borderColor;
  Color bodyColor;
  // icons
  Icon clearIcon;
  Widget body;
  TextInputType type;
  //
  Drawer drawer;
  BottomNavigationBar bottomNavigationBar;
  // Text
  TextAlign textAlign;
  SearchBar({
    Key key,
    this.hint,
    this.focus,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.radius,
    this.leading,
    this.backgroundColor,
    this.actions,
    this.type,
    this.body,
    this.borderColor,
    this.bodyColor,
    // icons
    this.clearIcon,
    // text
    this.textAlign,

    this.drawer,
    this.bottomNavigationBar,
  }) : super(key : key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  double _space = 10.0;
  
  Widget _cancel(){
    return FlatButton(
      child: Text("Cancel"),
      onPressed: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        setState(() {
          _space = 10.0;
        });
      },
    );
  }

  Widget _close(){
    return InkWell(
      child: Icon(
        FontAwesomeIcons.solidTimesCircle,
        color: Colors.grey,size: 18,
      ),
      onTap: (){
        WidgetsBinding.instance.addPostFrameCallback((_) => widget.controller.clear());
        widget.onClear();
      },
    );
  }

  Widget _suffixIcon(TextEditingController controller){
    if(controller.text != "")
      return _close();
    else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: this.widget.bodyColor == null ? Colors.white : this.widget.bodyColor,
        appBar: AppBar(
          leading: this.widget.leading,
          automaticallyImplyLeading: this.widget.leading == null ? false : true,
          backgroundColor: this.widget.backgroundColor == null ? Colors.white : widget.backgroundColor,
//            titleSpacing: this.widget.leading == null ? 10.0 : 10.0,
          titleSpacing: _space,
//          title: _search(bloc),
//          brightness: Brightness.dark,
          title: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            height: 40,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.shade200,
              border: new Border.all(
                color: Colors.grey.shade200,
                width: 0.5,
              ),
            ),
            child: new TextField(
              autofocus: widget.focus == null || widget.focus == false ? false : true,
//              focusNode: _focusNode,
              controller: widget.controller,
              textAlign: TextAlign.left,
              decoration: new InputDecoration(
                  hintText: "${widget.hint == null ? 'Search' : widget.hint}",
                  border: InputBorder.none,
                  suffixIcon: _suffixIcon(widget.controller)
              ),
              onChanged: (String value){
                widget.onChanged(value);
              },
              onTap: (){
                print("focus");
                if(Platform.isIOS){
                  setState(() {
                    _space = 5.0;
                  });
                } else if(Platform.isAndroid) {
                  setState(() {
                    _space = 10.0;
                  });
                }
              },
            ),
          ),
          actions: <Widget>[
            _cancel(),
          ],
        ),
        drawer: widget.drawer,
        body: this.widget.body,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}
