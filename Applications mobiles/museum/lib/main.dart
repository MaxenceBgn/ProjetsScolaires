// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Museum'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Artwork extends StatefulWidget {
  const Artwork({Key? key}) : super(key: key);

  @override
  _ArtworkState createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool isFavorite = false;
  bool _showDescription = false;

  int numberOfLikes = 55; //favoris
  Color alertColor = Colors.transparent;

  String _articleText =
      "La Joconde, ou portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 1516, et peut être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 x 53cm est exposée au musée du Louvres à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. \n\nLa Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. A l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribués à développer le mythe qui l'entoure, en faisant de ce tableau l'une des oeuvres d'art les plus célèbres au monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au XXie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le Diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.";
  Color articleColor = Colors.transparent;

  Color _colorOfBigFavoriteIconBeforeDisplayArticle = Colors.white;
  Color _bigFavoriteIconColor = Colors.white.withOpacity(0.25);
  Color _articleIconColor = Colors.brown;

  void _displayAlert(String alertText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(alertText),
        duration: const Duration(seconds: 2),
        backgroundColor: alertColor,
      ),
    );
  }

  void _clickOnFavorite() {
    if (isFavorite == true) {
      setState(() {
        isFavorite = false;
        numberOfLikes--;
        alertColor = Colors.red;
        _bigFavoriteIconColor = Colors.white.withOpacity(0.25);
        _displayAlert("Oeuvre supprimée de vos favoris.");
      });
    } else {
      setState(() {
        isFavorite = true;
        numberOfLikes++;
        alertColor = Colors.green;
        _displayAlert("Oeuvre ajoutée à vos favoris.");
        _bigFavoriteIconColor = Colors.red;
      });
    }
  }

  void _clickOnArticle() {
    if (_showDescription == false) {
      setState(() {
        _showDescription = true;
        articleColor = Colors.white;
        _colorOfBigFavoriteIconBeforeDisplayArticle = _bigFavoriteIconColor;
        _bigFavoriteIconColor = Colors.transparent;
        _articleIconColor = Colors.blue;
      });
    } else {
      setState(() {
        _showDescription = false;
        articleColor = Colors.transparent;
        _articleIconColor = _colorOfBigFavoriteIconBeforeDisplayArticle;
        _bigFavoriteIconColor = _colorOfBigFavoriteIconBeforeDisplayArticle;
        _articleIconColor = Colors.brown;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/Mona_Lisa.jpg'),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: IconButton(
                    icon: Icon(Icons.favorite,
                        color: _bigFavoriteIconColor, size: 100),
                    onPressed: () {
                      _clickOnFavorite();
                    }),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height - 350) / 3,
                left: (MediaQuery.of(context).size.width - 300) / 2,
                child: Container(
                  width: 300,
                  height: 350,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            _articleText,
                            style: TextStyle(fontSize: 15, color: articleColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: const Text(
                    "Mona Lisa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 30,
                      fontFamily: 'Merriweather',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: const Text(
                    "Léonard de Vinci",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            _clickOnArticle();
                          },
                          icon: Icon(
                            Icons.article,
                            color: _articleIconColor,
                          )),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _clickOnFavorite();
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: isFavorite ? Colors.red : Colors.brown,
                              )),
                          Text(
                            numberOfLikes.toString(),
                            style: TextStyle(
                              color: isFavorite ? Colors.red : Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application de la Joconde',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: Header(),
          body: Artwork(),
        ),
      ),
    );
  }
}
