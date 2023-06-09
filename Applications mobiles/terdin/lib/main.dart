import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terdin/liked_profile_provider.dart';
import 'myapp.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LikedProfileProvider(),
      child: const MyApp(),
    ),
  );
}
