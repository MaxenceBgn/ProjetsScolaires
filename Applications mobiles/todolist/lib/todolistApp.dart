import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/taskprovider.dart';
import 'package:todolist/screens/taskmaster.dart';

class TodolistApp extends StatelessWidget {
  const TodolistApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'TodoList',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const TasksMaster(),
      ),
    );
  }
}
