import 'package:flutter/material.dart';

class ContainBox extends StatelessWidget {

  final String hint;
  final Function onTap;

  ContainBox({
    @required this.hint,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(this.hint ?? "Search",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16,
            ),
          ),
        ),
        onTap: () => this.onTap(),
      ),
    );
  }
}
