import 'package:flutter/material.dart';
import '../models/bachelor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _profiles = Bachelor.generateRandomProfiles(30);

  Color? getTileColor(int index, List<Bachelor> bachelors) {
    if (bachelors[index].isOnline == true) {
      return Colors.grey;
    } else {
      return Colors.grey[700];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _profiles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: getTileColor(index, _profiles),
                    textColor: Colors.white,
                    leading: Image.asset(_profiles[index].avatar),
                    title: Text(
                        "${_profiles[index].firstname} ${_profiles[index].age} ans"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
