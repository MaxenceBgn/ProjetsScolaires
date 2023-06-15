import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/taskdetails.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TasksMaster> createState() => _TaskMasterPageState();
}

class _TaskMasterPageState extends State<TasksMaster> {
  //Definition de données de tests

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Affichage des tâches"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.tasks[index].title),
                    onTap: () {
                      // Naviguer vers la page de détails
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TaskDetails(task: widget.tasks[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
