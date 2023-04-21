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
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      "Mona Lisa",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                          fontSize: 30,
                          fontFamily: 'Arial'),
                    ),
                  ),
                  const Text("Léonard de Vinci")
                ])));
  }
}
