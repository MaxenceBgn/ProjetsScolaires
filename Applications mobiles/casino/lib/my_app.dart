import 'package:flutter/material.dart';
import 'my_homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      useMaterial3: true,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Casino',
          fontSize: 50, // Changer la taille de police ici
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casino Maxou',
      theme: theme,
      home: const MyHomePage(title: 'Casino Maxou'),
    );
  }
}
