library flutter_search_bar;

import 'package:flutter/material.dart';
import 'src/provider/bloc_provider.dart';
import 'src/bloc/bloc_search.dart';
import 'src/contain_box.dart';
import 'src/contain_field.dart';

enum SEARCH_MODE {
  BOX, SEARCH
}

class FlutterSearchBar extends StatelessWidget {
  // default
  final Widget leading;
  final List<Widget> actions;
  final Widget child;
  final SEARCH_MODE mode;
  // contain box
  final String hint;
  final Function onTap;
  // contain field
  final bool focus;
  final TextEditingController controller;
  final Function onChanged;
  final Function onSubmitted;
  final Function onClear;

  FlutterSearchBar({Key key,
    this.leading,
    this.actions,
    @required this.child,
    @required this.mode,
    this.hint,
    this.onTap,
    @required this.controller,
    this.focus,
    this.onChanged,
    this.onSubmitted,
    this.onClear
  }):super(key: key);
  // local variables
  // body color of scaffold
  static const Color bodyColor = Colors.white;
  // background color of background
  static const Color backgroundColor = Colors.white;
  // container space
  static const double space = 10.0;
  // contain
  Widget _container(BlocSearch bloc){
    if(this.mode == SEARCH_MODE.BOX){
      return ContainBox(
        hint: this.hint,
        onTap: this.onTap,
      );
    } else {
      return ContainField(
        bloc: bloc,
        hint: this.hint,
        controller: this.controller,
        onChanged: this.onChanged,
        onSubmitted: this.onSubmitted,
        onClear: this.onClear,
        focus: this.focus,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocSearch();
    return BlocProvider(
      bloc: bloc,
      child: Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          leading: this.leading,
          automaticallyImplyLeading: this.leading == null ? false : true,
          backgroundColor: backgroundColor,
          titleSpacing: space,
          title: _container(bloc),
          actions: this.actions,
        ),
        body: this.child,
      ),
    );
  }
}
