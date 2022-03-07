import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Label extends StatelessWidget {
  Label(this.desc, this.value);

  String desc;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Row(children: [
          Text(desc,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Arial")),
          Text(value,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontFamily: "Arial"))
        ]));
  }
}
