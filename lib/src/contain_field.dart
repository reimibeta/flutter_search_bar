import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainField extends StatefulWidget {

  final bool focus;
  final String hint;
  final TextEditingController controller;
  final Function onChanged;
  final Function onClear;

  ContainField({
    @required this.focus,
    @required this.hint,
    @required this.controller,
    @required this.onChanged,
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
          widget.controller.clear();
          widget.onClear();
        });
      },
    );
  }

  Widget _suffixIcon(TextEditingController controller){
    if(controller.text != "")
      return _close();
    else
      return Container(width: 0,);
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
          suffixIcon: _suffixIcon(widget.controller),
        ),
        onChanged: (String value){
          setState(() {
            widget.controller.text = value;
          });
          widget.onChanged(value);
          print(value);
        },
      ),
    );
  }
}

