import 'package:flutter/material.dart';
import 'package:emarket/models/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Détails du produit - ${widget.product.title}"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.product.description),
            // Ajoutez d'autres widgets pour afficher les détails du produit ici
          ],
        ),
      ),
    );
  }
}
