import 'package:flutter/material.dart';
import 'package:jdrwesh/service/color_service.dart';

import 'package:jdrwesh/model/campagne.dart';
import 'package:jdrwesh/service/campagne_service.dart';
import 'package:jdrwesh/service/player_service.dart';
import 'package:jdrwesh/widget/campagne_list.dart';

CampagneService campagneService = CampagneService();
ColorService colorService = ColorService();
PlayerService playerService = PlayerService();

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
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Color.fromARGB(255, 18, 32, 47)),
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
      body: Center(child: CampagneList(campagnes: widget.campagnes)),
    );
  }
}
