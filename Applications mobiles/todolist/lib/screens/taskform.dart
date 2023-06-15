import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskprovider.dart';
import 'package:todolist/screens/taskmaster.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _description = '';

  void _createTask(String title, String content) {
    Task newTask = Task();
    newTask.title = title;
    newTask.content = content;

    Provider.of<TaskProvider>(context, listen: false).createTask(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer une tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom de la tâche',
                ),
                keyboardType: TextInputType.text,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vous devez nommer la tâche que vous souhaitez créer.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _taskName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description de la tâche',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vous devez décrire la tâche que vous souhaitez créer.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _createTask(_taskName, _description);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TasksMaster(),
                    ),
                  );
                },
                child: const Text('Créer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
