import 'package:flutter/material.dart';

class FoodItemModel extends ChangeNotifier {
  final List _foodItems = [
    [
      "Ayam Penyet",
      "images/ayam penyet.jpg",
      6.9,
      ["Rice","Less Rice Portion","Normal Rice Portion"]
    ],
    [
      "Maggi Goreng",
      "images/maggi goreng.jpeg",
      4.2,
      ["Noodles","Less Noodles Portion","Normal Noodles Portion"]
    ],
    [
      "Nasi Goreng",
      "images/nasi goreng.jpg",
      5.0,
      ["Rice","Less Rice Portion","Normal Rice Portion"]
    ],
    [
      "Nasi Lemak",
      "images/nasi lemak.jpeg",
      5.5,
      ["Rice","Less Rice Portion","Normal Rice Portion"]
    ],
  ];

  get foodItem => _foodItems;
}
