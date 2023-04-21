import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: const Text(
                  "Mona Lisa",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    fontSize: 30,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                "Léonard de Vinci",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              )
            ],
          ),
          const Row(
            children: [
              Column(
                children: [Icon(Icons.article)],
              ),
              Column(
                children: [Icon(Icons.favorite)],
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
