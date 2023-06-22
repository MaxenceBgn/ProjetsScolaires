import 'package:flutter/material.dart';
import 'package:emarket/screens/homepage.dart';

class EMarket extends StatelessWidget {
  const EMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxou Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductListPage(title: 'Maxou Shop'),
    );
  }
}
