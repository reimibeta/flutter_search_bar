import 'package:flutter/material.dart';
import '../src/bloc/bloc_search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainField extends StatefulWidget {

  final BlocSearch bloc;
  final bool focus;
  final String hint;
  final TextEditingController controller;
  final Function onChanged;
  final Function onSubmitted;
  final Function onClear;

  ContainField({
    @required this.bloc,
    @required this.focus,
    @required this.hint,
    @required this.controller,
    @required this.onChanged,
    @required this.onSubmitted,
    @required this.onClear
  });

  @override
  _ContainFieldState createState() => _ContainFieldState();
}

class _ContainFieldState extends State<ContainField> {

  Widget _close(){
    return InkWell(
      child: Icon(
        FontAwesomeIcons.solidTimesCircle,
        color: Colors.grey,size: 18,
      ),
      onTap: (){
        WidgetsBinding.instance.addPostFrameCallback((_){
          // clear controller
          widget.controller.clear();
          // clear bloc
          widget.bloc.sinkText("");
          // on clear function
          if(widget.onClear != null)
            widget.onClear();
        });
      },
    );
  }

  Widget _suffixIcon(){
    return StreamBuilder(
      stream: widget.bloc.text,
      builder: (context, snapshot){
        if(snapshot.hasData){
          if(snapshot.data != "")
            return _close();
          else
            return Container(width: 0,);
        } else {
          widget.bloc.sinkText("");
          return Container(width: 0,);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: widget.controller,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.grey.shade800
        ),
        decoration: new InputDecoration(
          hintText: widget.hint ?? "Search",
          hintStyle: TextStyle(color: Colors.grey.shade800),
          border: InputBorder.none,
          suffixIcon: _suffixIcon(),
        ),
        onChanged: (String v){
          widget.onChanged(v);
          widget.bloc.sinkText(v);
        },
        onSubmitted: (v){
          widget.onSubmitted(v);
          widget.bloc.sinkText(v);
        },
      ),
    );
  }
}

