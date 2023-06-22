import 'package:emarket/models/providers/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cart.itemCount,
        itemBuilder: (BuildContext context, int index) {
          final cartItem = cartProvider.cart.items[index];

          return ListTile(
            title: Text(cartItem.title),
            subtitle: const Text('Quantité: 0'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartProvider.removeFromCart(cartItem);
              },
            ),
          );
        },
      ),
    );
  }
}
