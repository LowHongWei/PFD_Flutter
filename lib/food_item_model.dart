import 'package:flutter/material.dart';

class FoodItemModel extends ChangeNotifier {
  final List _foodItems = [
    [
      "Ayam Penyet",
      "images/ayam penyet.jpg",
      6.9,
      ["Rice", "Less Rice Portion", "Normal Rice Portion"]
    ],
    [
      "Maggi Goreng",
      "images/maggi goreng.jpeg",
      4.2,
      ["Noodles", "Less Noodles Portion", "Normal Noodles Portion"]
    ],
    [
      "Nasi Goreng",
      "images/nasi goreng.jpg",
      5.0,
      ["Rice", "Less Rice Portion", "Normal Rice Portion"]
    ],
    [
      "Nasi Lemak",
      "images/nasi lemak.jpeg",
      5.5,
      ["Rice", "Less Rice Portion", "Normal Rice Portion"]
    ],
  ];

  get foodItem => _foodItems;

  //Cart

  List _cartItems = [];

  get cartItems => _cartItems;

  void addItemsToCart(int qty, String name, double price) {
    _cartItems.add([qty, name, price]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.remove(_cartItems[index]);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += (_cartItems[i][2] * _cartItems[i][0]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
