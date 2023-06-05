import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_item_provider.dart';
import 'cart.dart';
import 'cart_provider.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListProviderItem>(
      builder: (context, listProviderItem, _) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Catalogue'),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: listProviderItem.listItems.length,
              itemBuilder: (context, index) {
                final item = listProviderItem.listItems[index];
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
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Consumer<CartListProvider>(
                        builder: (context, cartListProvider, _) {
                          cartListProvider.addItemToCart(item);
                          return Container();
                        },
                      );
                    },
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                listProviderItem.addItem();
              },
            ),
          ),
        );
      },
    );
  }
}
