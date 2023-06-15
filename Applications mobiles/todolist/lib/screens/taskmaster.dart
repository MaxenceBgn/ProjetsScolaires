import 'package:flutter/material.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key, required this.title});

  final String title;

  @override
  State<TasksMaster> createState() => _TaskMasterPageState();
}

class _TaskMasterPageState extends State<TasksMaster> {
  List<String> itemList = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itemList[index]),
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
