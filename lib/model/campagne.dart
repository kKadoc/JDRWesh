class Campagne {
  String? nom;
  String? mj;
  String? systeme;
  String? artWork;
  late DateTime debut;
  DateTime? fin;
  String? description;

  Campagne();

  Campagne.byItem(item) {
    nom = item["nom"];
    mj = item["mj"];
    systeme = item["systeme"];
    artWork = item["artwork"];
    debut = DateTime.parse(item["debut"]);
    //fin = DateTime.parse(item["fin"]);
    //description = item["description"];
  }
}
