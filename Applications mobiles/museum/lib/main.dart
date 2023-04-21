import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Application de la Joconde',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Museum'),
            ),
            body: SingleChildScrollView(
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
                                fontFamily: 'Merriweather'),
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
                              color: Colors.brown),
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
                  ]),
            )));
  }
}
