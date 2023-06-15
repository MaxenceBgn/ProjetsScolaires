import 'package:flutter/material.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key, required this.title});

  final String title;

  @override
  State<TaskDetails> createState() => _TaskMasterPageState();
}

class _TaskMasterPageState extends State<TaskDetails> {
  List<String> itemList = ['Item 1', 'Item 2', 'Item 3'];

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
            Text("Aller promener le chien"),
            Text("Créateur de la tâche : Maxence BOURGIN"),
            Text("Créée le 15.06.2023"),
            Text("DeadLine : tâche a effectuer pour le 15.06.2023"),
            Text(
                "Description de la tâche : Sortir promener Taika pour une ballade d'au moins une heure au parc de Courcelles-Chaussy.")
          ],
        ),
      ),
    );
  }
}
