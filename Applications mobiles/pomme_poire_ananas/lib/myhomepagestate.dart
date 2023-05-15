import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String title = "Cc";
  List<int> items = [1, 2, 3, 4, 5];
  List<int> primeNumber = [
    2,
    3,
    5,
    7,
    11,
    13,
    17,
    19,
    23,
    29,
    31,
    37,
    41,
    47,
    53,
    59,
    61,
    67,
    71,
    73,
    79,
    83,
    89,
    97
  ];
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = items.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              MaterialColor _tileColor;
              if (items[index] % 2 == 0) {
                _tileColor = Colors.blue;
              } else {
                _tileColor = Colors.indigo;
              }
              String _asset;
              if (primeNumber.contains(items[index])) {
                _asset = "images/ananas.png";
                title = "Ananas";
              } else {
                if (items[index] % 2 == 0) {
                  _asset = "images/poire.png";
                  title = "Poire";
                } else {
                  _asset = "images/pomme.png";
                  title = "Pomme";
                }
              }

              return ListTile(
                tileColor: _tileColor,
                textColor: Colors.white,
                leading: Image.asset(_asset),
                title: Text(items[index].toString()),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                int counter = items.length + 1;
                items.add(counter);
              });
            },
            child: Text('Nouveau fruit'),
          ),
        ],
      ),
    );
  }
}
