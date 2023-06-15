import 'package:flutter/material.dart';
import 'package:todolist/screens/taskdetails.dart';
import 'package:todolist/screens/taskpreview.dart';

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
      home: const TaskPreview(title: 'Todo List'),
    );
  }
}
