import 'package:flutter/material.dart';
import 'package:emarket/screens/homepage.dart';

class EMarket extends StatelessWidget {
  const EMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxou Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Maxou Shop'),
    );
  }
}
