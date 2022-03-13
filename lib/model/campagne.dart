import 'package:jdrwesh/model/joueur.dart';

class Campagne {
  late String nom;
  late Joueur mj;
  String? systeme;
  List<String> artworks = [];
  late DateTime debut;
  String statut = "en cours";
  DateTime? fin;
  String? resume;
  List<Joueur> joueurs = [];

  Campagne();

  Campagne.byItem(item) {
    nom = item["nom"];
    mj = Joueur(item["mj"]["nom"]);
    mj.artwork = item["mj"]["artwork"];
    mj.personnage = item["mj"]["personnage"];
    mj.niveau = item["mj"]["niveau"];
    mj.classe = item["mj"]["classe"];
    systeme = item["systeme"];
    resume = item["resume"];
    if (item["artworks"] != null) {
      for (var a in item["artworks"]) {
        artworks.add(a.toString());
      }
    }
    debut = DateTime.parse(item["debut"]);
    if (item["fin"] != null) {
      fin = DateTime.parse(item["fin"]);
    }
    if (item["joueurs"] != null) {
      for (var j in item["joueurs"]) {
        Joueur joueur = Joueur(j["nom"]);
        joueur.artwork = j["artwork"];
        joueur.personnage = j["personnage"];
        joueur.niveau = j["niveau"];
        joueur.classe = j["classe"];
        joueurs.add(joueur);
      }
    }

    if (item["statut"] != null) {
      statut = item["statut"];
    }
    //fin = DateTime.parse(item["fin"]);
    //description = item["description"];
  }
}
