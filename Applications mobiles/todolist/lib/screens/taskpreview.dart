import 'package:flutter/material.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({super.key, required this.title});

  final String title;

  @override
  State<TaskPreview> createState() => _TaskMasterPageState();
}

class _TaskMasterPageState extends State<TaskPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "La liste contient X tâches, dont X ont été réalisées, et X sont en attente de réalisation. X tâches arrivent à expiration dans moins de 2 jours.")
          ],
        ),
      ),
    );
  }
}
