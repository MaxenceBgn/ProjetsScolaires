import 'package:flutter/material.dart';
import 'package:emarket/screens/productlistpage.dart';

class EMarket extends StatelessWidget {
  const EMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxou Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 24, 146, 34)),
        useMaterial3: true,
      ),
      home: const ProductListPage(title: 'Maxou Shop'),
    );
  }
}
