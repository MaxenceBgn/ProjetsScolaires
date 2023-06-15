import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:intl/intl.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Détail d'une tâche"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.task.title),
            const Text("Créateur de la tâche : Maxence BOURGIN"),
            Text(
                "Créée le ${DateFormat('dd.MM.yyyy').format(widget.task.createdAt)}"),
            Text(
                "DeadLine : tâche à effectuer pour le ${DateFormat('dd.MM.yyyy').format(widget.task.deadLine)}"),
            Text("Description de la tâche : ${widget.task.content}")
          ],
        ),
      ),
    );
  }
}
