import 'package:emarket/screens/productlistpage.dart';
import 'package:flutter/material.dart';
import 'package:emarket/widgets/emarket.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => createProvider(),
      child: const EMarket(),
    ),
  );
}
