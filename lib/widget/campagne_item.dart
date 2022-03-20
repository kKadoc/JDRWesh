import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jdrwesh/main.dart';
import 'package:jdrwesh/model/campagne.dart';
import 'package:jdrwesh/model/joueur.dart';
import 'package:jdrwesh/widget/Label.dart';
import 'package:jdrwesh/widget/right_signet.dart';
import 'package:intl/date_symbol_data_local.dart';

class CampagneItem extends StatefulWidget {
  CampagneItem({Key? key, required this.campagne}) : super(key: key);

  final Campagne campagne;
  bool expanded = false;
  int currentImageIndex = 0;

  @override
  _CampagneItemState createState() => _CampagneItemState();
}

class _CampagneItemState extends State<CampagneItem> {
  toggleExpanded() {
    setState(() {
      widget.expanded = !widget.expanded;
    });
  }

  nextImg() {
    setState(() {
      if (widget.currentImageIndex == widget.campagne.artworks.length - 1) {
        widget.currentImageIndex = 0;
      } else {
        widget.currentImageIndex++;
      }
    });
  }

  previousImg() {
    setState(() {
      if (widget.currentImageIndex == 0) {
        widget.currentImageIndex = widget.campagne.artworks.length - 1;
      } else {
        widget.currentImageIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        // Define how long the animation should take.
        duration: const Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.ease,
        constraints: BoxConstraints(maxWidth: !widget.expanded ? 700 : 1400),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: AspectRatio(
            aspectRatio: !widget.expanded ? 16 / 6 : 16 / 9,
            child: ClipRRect(
              child: Stack(
                children: [
                  _buildBackground(context),
                  _buildGradient(),
                  _buildTitleAndSubtitle(),
                  _buildInfos(),
                  _buildPlayers(),
                  _buildDM(),
                  _buildMoreButton(),
                  _buildCarousel(),
                ],
              ),
            ),
          ),
        ));
  }

  CarouselController buttonCarouselController = CarouselController();

  Widget _buildInfos() {
    return widget.expanded
        ? Positioned(
            top: 70,
            left: 0,
            child: AnimatedContainer(
                // Define how long the animation should take.
                duration: const Duration(seconds: 1),
                // Provide an optional curve to make the animation feel smoother.
                width: widget.expanded ? 400 : 0,
                curve: Curves.ease,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(widget.expanded ? 0.6 : 0.6),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        )),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 3, 30, 3),
                        child: Column(children: [
                          Divider(),
                          Label(
                              "Début : ",
                              DateFormat('dd/MM/y')
                                  .format(widget.campagne.debut)),
                          Label(
                              "Fin : ",
                              widget.campagne.fin != null
                                  ? DateFormat('dd/MM/y')
                                      .format(widget.campagne.fin!)
                                  : "-"),
                          Label(
                              "Résultat : ",
                              widget.campagne.fin != null
                                  ? widget.campagne.statut
                                  : "Campagne en cours"),
                          Divider(),
                          Label("Résumé", ""),
                          Text(widget.campagne.resume.toString(),
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: "Arial"))
                        ])))))
        : Container();
  }

  Widget _buildCarousel() {
    return Positioned(
        top: 15,
        right: 0,
        child: AnimatedContainer(
            // Define how long the animation should take.
            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            width: widget.expanded ? 932 : 0,
            curve: Curves.ease,
            color: Colors.white.withOpacity(0.6),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                iconSize: 50,
                icon: const Icon(Icons.chevron_left),
                color: Colors.black87,
                onPressed: () => previousImg(),
              ),
              Container(
                  width: widget.expanded ? 800 : 0,
                  height: 500,
                  child: Image.asset("assets/artworks/" +
                      widget.campagne.artworks[widget.currentImageIndex])),
              IconButton(
                  iconSize: 50,
                  color: Colors.black87,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => nextImg())
            ])));

    /* return Positioned(
        top: 15,
        right: 0,
        child: AnimatedContainer(
            // Define how long the animation should take.
            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            width: widget.expanded ? 932 : 0,
            curve: Curves.ease,
            color: Colors.white.withOpacity(0.7),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                iconSize: 50,
                icon: const Icon(Icons.chevron_left),
                color: Colors.black,
                onPressed: () => buttonCarouselController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear),
              ),
              Container(
                  width: widget.expanded ? 800 : 0,
                  child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      autoPlay: false,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: widget.campagne.artworks.map<Widget>((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/artworks/" + i))));
                        },
                      );
                    }).toList(),
                  )),
              IconButton(
                  iconSize: 50,
                  color: Colors.black,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear))
            ]))); */
  }

  Widget _buildMoreButton() {
    return Positioned(
        left: 10,
        bottom: 15,
        child: ElevatedButton(
          onPressed: () {
            toggleExpanded();
          },
          style:
              ElevatedButton.styleFrom(primary: Colors.white.withOpacity(0.6)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.expanded ? 'Réduire' : 'Détails',
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black, fontFamily: "Arial"),
                ),
                Icon(
                  widget.expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.black87,
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildPlayers() {
    return AnimatedPositioned(
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      right: widget.expanded ? 150 : 0,
      bottom: 15,
      child: RightSignet(
          [for (final joueur in widget.campagne.joueurs) _buildAvatar(joueur)],
          widget.expanded ? 0 : 35),
    );
  }

  Widget _buildDM() {
    return AnimatedPositioned(
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      right: 0,
      bottom: widget.expanded ? 15 : 80,
      child: RightSignet(
          [_buildAvatar(widget.campagne.mj)], widget.expanded ? 0 : 35),
    );
  }

  Widget _buildAvatar(Joueur player) {
    return Stack(children: [
      AnimatedContainer(
        // Define how long the animation should take.
        duration: const Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.ease,
        width: widget.expanded ? 120 : 50,
        height: widget.expanded ? 200 : 50,
        child: widget.expanded
            ? Column(children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 2),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey)),
                      child: Image.asset(
                        "assets/players/" +
                            (player.artwork != null
                                ? player.artwork.toString()
                                : "0.jpg"),
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: player.personnage != null
                      ? Text(player.personnage.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial"))
                      : null,
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: player.classe != null
                      ? Text(
                          player.classe.toString() +
                              (player.niveau != null
                                  ? " niv. " + player.niveau.toString()
                                  : ""),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontFamily: "Arial"))
                      : null,
                )
              ])
            : null,
      ),
      Positioned(
          top: 0,
          right: 0,
          child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                  decoration: BoxDecoration(
                    color: colorService.getColor(player.nom),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5, color: Colors.black, spreadRadius: 1)
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: playerService.hasPicture(player.nom)
                          ? CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/players/" + player.nom + ".jpg"),
                            )
                          : CircleAvatar(
                              backgroundColor:
                                  colorService.getColor(player.nom),
                              child: Text(
                                player.nom.substring(0, 2),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Arial"),
                              ))))))
    ]);
  }

  Widget _buildBackground(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        "assets/artworks/" + widget.campagne.artworks[0],
        fit: BoxFit.cover,
      ),
      AnimatedContainer(
        // Define how long the animation should take.
        duration: const Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(widget.expanded ? 0.4 : 0)),
      )
    ]);
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(widget.expanded ? 0.6 : 0.3),
              Colors.white.withOpacity(widget.expanded ? 0.6 : 0)
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
        left: 0,
        top: 15,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Container(
                width: 400,
                decoration: BoxDecoration(
                    color:
                        Colors.white.withOpacity(widget.expanded ? 0.6 : 0.6),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(widget.expanded ? 0 : 35),
                      bottomRight: Radius.circular(widget.expanded ? 0 : 35),
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 30, 3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.campagne.nom.toString(),
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Arial"),
                      ),
                      Text(widget.campagne.systeme.toString(),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial"))
                    ],
                  ),
                ))));
  }
}
