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

  Future fetchUserData() async {
    uid = fAuth.currentUser!.uid;

    await fStore.collection('Users').doc('cart').get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          list = snapshot.data()!['cartItems'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: fetchUserData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list[index].toString()),
                        );
                      });
                })));
  }
}
