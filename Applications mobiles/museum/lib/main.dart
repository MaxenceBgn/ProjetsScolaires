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
  int numberOfLikes = 55;

  void _clickOnFavorite() {
    if (isFavorite == true) {
      setState(() {
        isFavorite = false;
        numberOfLikes--;
      });
    } else {
      setState(() {
        isFavorite = true;
        numberOfLikes++;
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
                        color: isFavorite
                            ? Colors.red
                            : Colors.white.withOpacity(0.35),
                        size: 100),
                    onPressed: () {
                      _clickOnFavorite();
                    }),
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
                      Icon(
                        Icons.article,
                        color: Colors.brown,
                      )
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
      home: const Scaffold(
        appBar: Header(),
        body: Artwork(),
      ),
    );
  }
}
