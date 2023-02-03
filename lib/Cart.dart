import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfd_flutter/food_item_model.dart';
import 'package:pfd_flutter/profile.dart';
import 'package:pfd_flutter/qrCode.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
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
                    builder: (context) => const QrCode(),
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
                            width: MediaQuery.of(context).size.width * 0.85,
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
                            width: MediaQuery.of(context).size.width * 0.85,
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07),
                                      child: const Text(
                                        "Qty",
                                        style: TextStyle(
                                            color: Color(0xFFF9CF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.07),
                                    child: const Text(
                                      "Item",
                                      style: TextStyle(
                                          color: Color(0xFFF9CF00),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07),
                                      child: const Text(
                                        "Total",
                                        style: TextStyle(
                                            color: Color(0xFFF9CF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: value.cartItems.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      value.cartItems[index][1],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
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
