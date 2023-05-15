import 'package:flutter/material.dart';
import 'artwork.dart';
import 'header.dart';

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
      home: const ScaffoldMessenger(
        child: Scaffold(
          appBar: Header(),
          body: Artwork(),
        ),
      ),
    );
  }
}
