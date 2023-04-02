import 'package:flutter/services.dart';

import '../model/campagne.dart';
import 'dart:convert';

class CampagneService {
  List<Campagne>? campagnes;

  CampagneService();

  getCampagnes() async {
    if (campagnes == null) {
      await loadData();
    }
    return campagnes;
  }

  loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    campagnes = [];
    var firstYear = DateTime.now().year;
    var lastYear = firstYear;
    for (final item in data["campagnes"]) {
      print(item);
      var c = Campagne.byItem(item);
      campagnes!.add(c);

      if (c.debut.year < firstYear) {
        firstYear = c.debut.year;
      }
    }
    for (var y = firstYear; y <= lastYear; y++) {
      var cYear = Campagne();
      cYear.nom = y.toString();
      cYear.debut = DateTime.parse(y.toString() + "-01-01");

      campagnes!.add(cYear);
      print(cYear);
    }

    campagnes!.sort((a, b) => b.debut.compareTo(a.debut));
  }
}
