import 'package:flutter/material.dart';
import 'widgets/taskmaster.dart';

class TodolistApp extends StatelessWidget {
  const TodolistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TasksMaster(title: 'Todo List'),
    );
  }
}
