import 'package:flutter/material.dart';

import 'model/campagne.dart';
import 'service/campagne_service.dart';
import 'widget/parallax/parallax.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

RegExp regYear = RegExp(r"^\d{4}$");
CampagneService campagneService = CampagneService();

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          campagne.artWork.toString(),
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            campagne.nom.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            campagne.systeme.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
