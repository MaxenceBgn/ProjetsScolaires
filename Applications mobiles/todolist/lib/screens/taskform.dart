import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key, required this.title});

  final String title;

  @override
  State<TaskForm> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _description = '';

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
                    // Do something with the form data
                    print('Nom: $_taskName');
                    print('Description: $_description');
                  }
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
