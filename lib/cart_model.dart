import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List _cartItems = [];

  get cartItems => _cartItems;

  void addItemsToCart(int qty, String name, double price) {
    _cartItems.add([qty, name, price]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.remove(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += (double.parse(_cartItems[i][2]) * _cartItems[i][0]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
