class Campagne {
  String? nom;
  String? mj;
  String? systeme;
  String? artWork;
  late DateTime debut;
  DateTime? fin;
  String? description;
  var joueurs = [];

  Campagne();

  Campagne.byItem(item) {
    nom = item["nom"];
    mj = item["mj"];
    systeme = item["systeme"];
    artWork = "assets/artworks/" + item["artwork"];
    debut = DateTime.parse(item["debut"]);
    if (item["joueurs"] != null) {
      for (var j in item["joueurs"]) {
        joueurs.add(j["nom"]);
      }
    }
    //fin = DateTime.parse(item["fin"]);
    //description = item["description"];
  }
}
