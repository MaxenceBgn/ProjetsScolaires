import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskprovider.dart';
import 'package:todolist/screens/taskdetails.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key});

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
                      tileColor: Colors.blueAccent,
                      textColor: Colors.white,
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
        }));
  }
}
