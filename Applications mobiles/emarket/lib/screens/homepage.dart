import 'package:emarket/screens/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:emarket/models/product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key, required this.title});

  final String title;

  @override
  State<ProductListPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductListPage> {
  List<Product> productList = [];
  int selectedTileIndex = -1;

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
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTileIndex = index;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: productList[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.network(
                        productList[index].images[0],
                        width: 40,
                        height: 40,
                      ),
                      title: Text(productList[index].title),
                      tileColor: index == selectedTileIndex
                          ? Colors.blue.withOpacity(
                              0.2) // Couleur de mise en évidence de la tuile sélectionnée
                          : null,
                    ),
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
