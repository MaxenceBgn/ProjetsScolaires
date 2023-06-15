import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskprovider.dart';
import 'package:todolist/screens/taskmaster.dart';

class TaskModifyForm extends StatefulWidget {
  const TaskModifyForm({super.key, required this.taskToModify});

  final Task taskToModify;

  @override
  // ignore: library_private_types_in_public_api
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskModifyForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _description = '';

  void _updateTask(String title, String content) {
    Task updatedTask = Task();
    updatedTask.id = widget.taskToModify.id;
    updatedTask.title = title;
    updatedTask.content = content;

    Provider.of<TaskProvider>(context, listen: false).updateTask(updatedTask);
  }

  @override
  void initState() {
    super.initState();
    _taskName = widget.taskToModify.title;
    _description = widget.taskToModify.content;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier une tâche'),
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
                initialValue: _taskName,
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
                initialValue: _description,
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
                    _updateTask(_taskName, _description);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TasksMaster(),
                    ),
                  );
                },
                child: const Text('Modifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
