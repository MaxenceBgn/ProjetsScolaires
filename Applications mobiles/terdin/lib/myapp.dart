import 'package:flutter/material.dart';
import 'package:terdin/profiledetails.dart';
import 'myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terdin',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 165, 6, 67),
      )),
      home: const MyHomePage(title: 'Terdin'),
      routes: {
        '/profiledetails': (context) => const ProfileDetailsPage(
              title: "Détails du profil",
            ), /////////////Mettre nom de page comme le précédent
      },
    );
  }
}
