import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = "Cc";
  List<int> items = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    updateTitle();
  }

  void updateTitle() {
    if (verifyIfNumberIsPrime(items.length)) {
      _title = createTitle("Ananas");
    } else if (items.length % 2 == 0) {
      _title = createTitle("Poire");
    } else {
      _title = createTitle("Pomme");
    }
  }

  bool verifyIfNumberIsPrime(int numberToVerify) {
    {
      if (numberToVerify <= 1) {
        return false;
      }

      for (int i = 2; i <= numberToVerify / 2; i++) {
        if (numberToVerify % i == 0) {
          return false;
        }
      }

      return true;
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
              String asset;
              if (verifyIfNumberIsPrime(items[index])) {
                asset = "images/ananas.png";
              } else {
                if (items[index] % 2 == 0) {
                  asset = "images/poire.png";
                } else {
                  asset = "images/pomme.png";
                }
              }

              return ListTile(
                tileColor: tileColor,
                textColor: Colors.white,
                leading: Image.asset(asset),
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
            child: const Text('Nouveau fruis'),
          ),
        ],
      ),
    );
  }
}
