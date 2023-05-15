import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = "Cc";
  List<int> items = [1, 2, 3, 4, 5];
  final List<int> _primeNumber = [
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

  @override
  void initState() {
    super.initState();
    updateTitle();
  }

  void updateTitle() {
    if (_primeNumber.contains(items.length)) {
      _title = createTitle("Ananas");
    } else if (items.length % 2 == 0) {
      _title = createTitle("Poire");
    } else {
      _title = createTitle("Pomme");
    }
  }

  String createTitle(String typeToDisplay) {
    String newTitle = "${items[items.length - 1]}. $typeToDisplay";
    return newTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              MaterialColor tileColor;
              if (items[index] % 2 == 0) {
                tileColor = Colors.blue;
              } else {
                tileColor = Colors.indigo;
              }
              String _asset;
              if (_primeNumber.contains(items[index])) {
                _asset = "images/ananas.png";
              } else {
                if (items[index] % 2 == 0) {
                  _asset = "images/poire.png";
                } else {
                  _asset = "images/pomme.png";
                }
              }

              return ListTile(
                tileColor: tileColor,
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
                updateTitle();
              });
            },
            child: Text('Nouveau fruit'),
          ),
        ],
      ),
    );
  }
}
