import 'package:flutter/material.dart';
import 'package:terdin/profiledetails.dart';
import 'myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terdin',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 165, 6, 67),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Terdin'),
        '/profiledetails': (context) => ProfileDetailsPage(
              title: "Détails du profil",
              selectedPerson: null,
            ),
      },
    );
  }
}
