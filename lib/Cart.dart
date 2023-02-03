import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfd_flutter/food_item_model.dart';
import 'package:pfd_flutter/profile.dart';
import 'package:pfd_flutter/userQrCode.dart';
import 'package:pfd_flutter/register.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  List list = [
    'ayam penyet',
    2,
    'maggi goreng',
    2
  ]; // list must be in this format

  @override
  void initState() {
    super.initState();
  }

  Future addList(List cartList) async {
    DocumentReference docUser = fStore.collection('Users').doc('cart');
    // List list = ['ayam penyet', 2, 'maggi goreng', 2]; List must be in this format

    final json = {'cartItems': cartList};

    docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9CF00),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9CF00),
          elevation: 0,
          title: Image.asset(
            'images/IconBlack.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserQrCode(),
                  ),
                );
              },
              icon: Image.asset('images/qr-code black.png'),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
              icon: Image.asset('images/cart.png'),
            ),
            IconButton(
              icon: Image.asset('images/user.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Consumer<FoodItemModel>(
          builder: ((context, value, child) {
            return Center(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: SizedBox(
                      width: 340,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: const BoxDecoration(
                        color: Color(0xFF272D2F),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF9CF00),
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.1,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                                child: const Align(
                                  alignment: Alignment.topLeft,
                                  child: Center(
                                    child: Text(
                                      'Food Cart',
                                      style: TextStyle(
                                          color: Color(0xFFF9CF00),
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0xFF272D2F),
                                border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFFF9CF00), width: 3),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      child: const Text(
                                        "Qty",
                                        style: TextStyle(
                                            color: Color(0xFFF9CF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: const Text(
                                      "Item",
                                      style: TextStyle(
                                          color: Color(0xFFF9CF00),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      child: const Text(
                                        "Price",
                                        style: TextStyle(
                                            color: Color(0xFFF9CF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      child: const Text(
                                        "Action",
                                        style: TextStyle(
                                            color: Color(0xFFF9CF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                itemCount: value.cartItems.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF272D2F),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05),
                                              child: Text(
                                                "x${value.cartItems[index][0]}",
                                                style: const TextStyle(
                                                    color: Color(0xFFF9CF00),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            value.cartItems[index][1],
                                            style: const TextStyle(
                                                color: Color(0xFFF9CF00),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.07),
                                              child: Text(
                                                '\$${value.cartItems[index][2]}',
                                                style: const TextStyle(
                                                    color: Color(0xFFF9CF00),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color(0xFFF9CF00),
                                            ),
                                            onPressed: () {
                                              Provider.of<FoodItemModel>(
                                                      context,
                                                      listen: false)
                                                  .removeItemFromCart(index);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(36.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF9CF00),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.all(24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Total Price",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text("\$${value.calculateTotalPrice()}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.all(12),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        backgroundColor:
                                            Colors.red.withOpacity(0),
                                      ),
                                      child: Row(
                                        children: const [
                                          Text("Pay Now",
                                              style: TextStyle(fontSize: 20)),
                                          Icon(Icons.arrow_forward)
                                        ],
                                      ),
                                      onPressed: () {
                                        addList(list); // change list to ur list
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
