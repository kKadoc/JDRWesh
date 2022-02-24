import 'package:flutter/material.dart';
import 'package:jdrwesh/service/color_service.dart';

import 'model/campagne.dart';
import 'service/campagne_service.dart';
import 'widget/parallax/parallax.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

RegExp regYear = RegExp(r"^\d{4}$");
CampagneService campagneService = CampagneService();
ColorService colorService = ColorService();

void main() {
  runApp(const JDRWesh());
}

class JDRWesh extends StatelessWidget {
  const JDRWesh({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JDR Wesh !',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: HistoryPage(title: 'JDR Wesh !'),
    );
  }
}

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key, required this.title}) : super(key: key);

  final String title;
  List<Campagne> campagnes = [];

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  loadJson() async {
    widget.campagnes = await campagneService.getCampagnes();
    setState(() {});
  }

/*   void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const Drawer(
        child: Center(),
      ),
      body: Center(child: ListParallax(campagnes: widget.campagnes)),
    );
  }
}

class ListParallax extends StatelessWidget {
  ListParallax({Key? key, required this.campagnes}) : super(key: key);

  List<Campagne> campagnes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final campagne in campagnes)
            if (!regYear.hasMatch(campagne.nom.toString()))
              CampagneListItem(campagne: campagne)
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

class CampagneListItem extends StatelessWidget {
  CampagneListItem({Key? key, required this.campagne}) : super(key: key);

  final Campagne campagne;

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 700),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: AspectRatio(
            aspectRatio: 16 / 6,
            child: ClipRRect(
              child: Stack(
                children: [
                  _buildBackground(context),
                  _buildGradient(),
                  _buildTitleAndSubtitle(),
                  _buildSystemIcon(),
                  _buildPlayers(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildPlayers() {
    return Positioned(
      right: 10,
      bottom: 15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundColor:
                          colorService.getColor(campagne.mj.toString()),
                      child: Text(
                        campagne.mj.toString().substring(0, 2),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Arial"),
                      ),
                    ))
              ]),
          Row(
            children: [
              for (final joueur in campagne.joueurs)
                Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundColor: colorService.getColor(joueur.toString()),
                      child: Text(
                        joueur.toString().substring(0, 2),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Arial"),
                      ),
                    ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        campagne.artWork.toString(),
        key: _backgroundImageKey,
        fit: BoxFit.cover,
      )
    ]);
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.brown.withOpacity(0.5),
              Colors.white.withOpacity(0)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 1],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 10,
      top: 15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            campagne.nom.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Arial"),
          )
        ],
      ),
    );
  }

  Widget _buildSystemIcon() {
    var logo = "";
    switch (campagne.systeme) {
      case "D&D 5":
        logo = "dd5.png";
        break;

      case "D&D 4":
        logo = "dd4.png";
        break;

      case "D&D 3.5":
        logo = "dd3.png";
        break;

      case "D&D 3":
        logo = "dd3.png";
        break;

      case "Adalon":
        logo = "adalon.png";
        break;

      case "Temps de Faéments":
        logo = "faements.png";
        break;

      case "Star Wars Commando":
        logo = "swcommando.png";
        break;

      case "Star Wars D20":
        logo = "sw.png";
        break;
    }
    return Positioned(
        right: 10,
        top: 10,
        child: Image.asset("assets/logos/" + logo, height: 44));
  }
}
