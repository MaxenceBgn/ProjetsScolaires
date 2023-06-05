import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartListProvider>(
      builder: (context, cartListProvider, _) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Mon panier'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: cartListProvider.listItemsInCart.length,
              itemBuilder: (context, index) {
                final item = cartListProvider.listItemsInCart[index];
                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        color: item.color,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.colorName,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
