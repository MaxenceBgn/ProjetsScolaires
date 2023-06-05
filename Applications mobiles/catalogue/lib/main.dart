import 'package:catalogue/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_item_provider.dart';
import 'catalog.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ListProviderItem()),
      ChangeNotifierProvider(create: (_) => CartListProvider()),
    ],
    child: const MaterialApp(
      home: Catalog(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
