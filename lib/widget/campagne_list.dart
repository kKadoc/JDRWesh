import 'package:flutter/material.dart';
import 'package:jdrwesh/model/campagne.dart';
import 'package:jdrwesh/widget/campagne_item.dart';

class CampagneList extends StatelessWidget {
  CampagneList({Key? key, required this.campagnes}) : super(key: key);

  RegExp regYear = RegExp(r"^\d{4}$");

  List<Campagne> campagnes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final campagne in campagnes)
            if (!regYear.hasMatch(campagne.nom.toString()))
              CampagneItem(campagne: campagne)
            else
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.white,
                        height: 36,
                      )),
                ),
                Text(campagne.nom.toString()),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.white,
                        height: 36,
                      )),
                ),
              ]),
        ],
      ),
    );
  }
}
