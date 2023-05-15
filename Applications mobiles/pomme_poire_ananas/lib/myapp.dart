import 'package:flutter/material.dart';
import 'myhomepagestate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomme, Poire et Ananas',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 109, 199)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
