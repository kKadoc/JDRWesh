import 'package:flutter/material.dart';

class ColorService {
  int cpt = 0;
  var list = [
    Colors.blueAccent.shade700,
    Colors.amberAccent.shade700,
    Colors.greenAccent.shade700,
    Colors.cyanAccent.shade700,
    Colors.deepPurpleAccent.shade400,
    Colors.redAccent.shade400
  ];

  var usedColors = Map<String, Color>();

  getColor(String key) {
    if (usedColors.containsKey(key)) return usedColors[key];
    cpt++;
    if (cpt > list.length) cpt = 0;
    usedColors[key] = list[cpt];
    return list[cpt];
  }
}
