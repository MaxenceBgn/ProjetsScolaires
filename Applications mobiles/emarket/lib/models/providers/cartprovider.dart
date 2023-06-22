import 'package:emarket/models/cart.dart';
import 'package:emarket/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addToCart(Product product) {
    _cart.addToCart(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.removeFromCart(product);
    notifyListeners();
  }

  int getCartItemCount() {
    return _cart.itemCount;
  }
}
