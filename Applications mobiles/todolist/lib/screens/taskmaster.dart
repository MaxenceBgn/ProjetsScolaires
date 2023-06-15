import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskprovider.dart';
import 'package:todolist/screens/taskdetails.dart';
import 'package:todolist/screens/taskform.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key});

  @override
  State<TasksMaster> createState() => _TaskMasterPageState();
}

class _TaskMasterPageState extends State<TasksMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Affichage des tâches"),
      ),
      body: Consumer<TaskProvider>(builder: (context, taskProvider, _) {
        List<Task> tasks = taskProvider.tasks;

        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Task selectedTask = tasks[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetails(
                          task: selectedTask,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 218, 215, 215),
                    textColor: const Color.fromARGB(255, 51, 51, 51),
                    title: Row(
                      children: [
                        Text(tasks[index].title),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskForm(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
