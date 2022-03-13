import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RightSignet extends StatelessWidget {
  RightSignet(this.widgetList, this.radius);

  List<Widget> widgetList;
  double radius = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                )),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: widgetList))));
  }
}
