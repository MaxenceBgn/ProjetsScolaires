import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terdin/providers/bachelors_favorites_provider.dart';
import 'myapp.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BachelorsLikedCollection(),
      child: const MyApp(),
    ),
  );
}
