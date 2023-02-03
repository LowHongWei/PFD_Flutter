import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfd_flutter/main_menu.dart';
import 'package:pfd_flutter/main_start.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  String name = '';
  int saved = 0;
  String? uid;
  User? fUser;
  List list = [];
  List foodList = [];
  List qtyList = [];

  Future fetchUserData() async {
    uid = fAuth.currentUser!.uid;

    await fStore.collection('Users').doc('cart').get().then((snapshot) {
      if (snapshot.exists) {
        list = snapshot.data()!['cartItems'];
        foodList.add(list[0]);
        foodList.add(list[2]);
        qtyList.add(list[1]);
        qtyList.add(list[3]);
      }
    });
  }

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9CF00),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.07),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.85,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(0xFF272D2F),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Current Orders",
                      style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
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
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.07),
                          child: const Text(
                            "Item",
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
                                MediaQuery.of(context).size.width * 0.07),
                        child: const Text(
                          "Qty",
                          style: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.56,
              width: MediaQuery.of(context).size.width * 0.85,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: FutureBuilder(
                    future: fetchUserData(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.07),
                                    child: Text(
                                      foodList[index].toString(),
                                      style: const TextStyle(
                                          color: Color(0xFFF9CF00),
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                  child: Text(
                                    qtyList[index].toString(),
                                    style: const TextStyle(
                                        color: Color(0xFFF9CF00), fontSize: 15),
                                  ),
                                ),
                              ],
                            );
                          });
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.80,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF272D2F)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //  child: FutureBuilder(
    //               future: fetchUserData(),
    //               builder: (context, snapshot) {
    //                 return ListView.builder(
    //                     itemCount: list.length,
    //                     itemBuilder: (context, index) {
    //                       return ListTile(
    //                         title: Text(list[index].toString()),
    //                       );
    //                     });
  }
}
