import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _slot1 = 0;
  int _slot2 = 0;
  int _slot3 = 0;
  Image _imageSlot1 = Image.asset('images/cerise.png', width: 100, height: 100);
  Image _imageSlot2 = Image.asset('images/cerise.png', width: 100, height: 100);
  Image _imageSlot3 = Image.asset('images/cerise.png', width: 100, height: 100);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _definiteSlotsImages() {
    var rng = Random();
    _slot1 = rng.nextInt(6);
    _slot2 = rng.nextInt(6);
    _slot3 = rng.nextInt(6);

    setState(() {
      _imageSlot1 = _getImageForSlot(_slot1);
      _imageSlot2 = _getImageForSlot(_slot2);
      _imageSlot3 = _getImageForSlot(_slot3);
    });
  }

  Image _getImageForSlot(int slot) {
    switch (slot) {
      case 0:
        return Image.asset('images/bar.png', width: 100, height: 100);
      case 1:
        return Image.asset('images/cerise.png', width: 100, height: 100);
      case 2:
        return Image.asset('images/cloche.png', width: 100, height: 100);
      case 3:
        return Image.asset('images/diamant.png', width: 100, height: 100);
      case 4:
        return Image.asset('images/fer-a-cheval.png', width: 100, height: 100);
      case 5:
        return Image.asset('images/pasteque.png', width: 100, height: 100);
      default:
        return Image.asset('images/sept.png', width: 100, height: 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _imageSlot1,
                const SizedBox(width: 50),
                _imageSlot2,
                const SizedBox(width: 50),
                _imageSlot3,
              ],
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _definiteSlotsImages,
        tooltip: 'Lancer',
        backgroundColor: Colors.red[600],
        child: const Icon(Icons.casino),
      ),
    );
  }
}
