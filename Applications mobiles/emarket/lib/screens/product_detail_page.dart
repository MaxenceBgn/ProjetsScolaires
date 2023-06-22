import 'package:flutter/material.dart';
import 'package:emarket/models/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color stockColor() {
    if (widget.product.stock == 0) {
      return Colors.red;
    } else if (widget.product.stock < 20) {
      return Colors.yellow[800]!;
    } else {
      return const Color.fromARGB(255, 1, 148, 6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Détails du produit - ${widget.product.title}"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.product.images[0],
              width: 300,
              height: 300,
            ),
            Text(
              widget.product.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Catégorie: ${widget.product.category}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${widget.product.description}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.product.price} €',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Stock: ${widget.product.stock}',
              style: TextStyle(
                color: stockColor(),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
