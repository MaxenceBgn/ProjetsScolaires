import 'package:flutter/material.dart';
import 'list_item.dart';

class CartListProvider extends ChangeNotifier {
  int index = 0;
  List<ListItem> listItemsInCart = [];

  List<ListItem> get cartItems => listItemsInCart;

  void addItemToCart(ListItem itemToAdd) {
    listItemsInCart.add(itemToAdd);
    notifyListeners();
  }
}
