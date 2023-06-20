import 'package:flutter/material.dart';
import 'package:emarket/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    productList = await Product.fetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(productList[index].title),
                    // Autres widgets à ajouter dans la tuile
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
