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
    var annees = [];
    for (final item in data["campagnes"]) {
      print(item);
      var c = Campagne.byItem(item);
      campagnes!.add(c);

      if (!annees.contains(c.debut.year)) {
        annees.add(c.debut.year);
        var cYear = Campagne();
        cYear.nom = c.debut.year.toString();
        cYear.debut = DateTime.parse(c.debut.year.toString() + "-01-01");

        campagnes!.add(cYear);
      }

      campagnes!.sort((a, b) => a.debut.compareTo(b.debut));
    }
  }
}
