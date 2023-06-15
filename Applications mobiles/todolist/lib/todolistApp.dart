import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/taskmaster.dart';

class TodolistApp extends StatelessWidget {
  const TodolistApp({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: TasksMaster(
        tasks: tasks,
      ),
    );
  }
}
