// ignore: file_names
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfd_flutter/scanQrCode.dart';

class GivePoints extends StatefulWidget {
  const GivePoints({super.key});

  @override
  State<GivePoints> createState() => _GivePointsState();
}

class _GivePointsState extends State<GivePoints> {
  int cupQty = 0;
  int containerQty = 0;

  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  int? points;
  String? uid;
  User? fUser;

  Future updatePoints(String studentUid, int addPoints) async {
    fUser = fAuth.currentUser!;
    uid = fUser!.uid;

    await fStore
        .collection('Users')
        .doc(studentUid)
        .update({'points': FieldValue.increment(addPoints)});

    // fStore.collection('Users').doc(fUser!.uid).get().then((snapshot) {
    //   if (snapshot.exists) {
    //     points = int.parse(snapshot.data()!['points']) + 100;

    //     fStore.collection('Users').doc(studentUid).update({'points': FieldValue.increment(addPoints)});
    //   }
    // });
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
                      "Enter items used",
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
                                MediaQuery.of(context).size.width * 0.14),
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
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.85,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Reusable Cups",
                                style: TextStyle(
                                    color: Color(0xFFF9CF00), fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    child: FloatingActionButton(
                                      heroTag: "Remove Cups",
                                      onPressed: () {
                                        setState(() {
                                          if (cupQty > 0) {
                                            cupQty--;
                                          }
                                        });
                                      },
                                      backgroundColor: const Color(0xFFF9CF00),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.remove,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Center(
                                      child: Text(
                                        "x$cupQty",
                                        style: const TextStyle(
                                            color: Color(0xFFF9CF00),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    child: FloatingActionButton(
                                      heroTag: "Add Cups",
                                      onPressed: () {
                                        setState(() {
                                          cupQty++;
                                        });
                                      },
                                      backgroundColor: const Color(0xFFF9CF00),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.add,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Reusable Containers",
                              style: TextStyle(
                                  color: Color(0xFFF9CF00), fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: Row(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  child: FloatingActionButton(
                                    heroTag: "Remove Containers",
                                    onPressed: () {
                                      setState(() {
                                        if (containerQty > 0) {
                                          containerQty--;
                                        }
                                      });
                                    },
                                    backgroundColor: const Color(0xFFF9CF00),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.remove,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(
                                    child: Text(
                                      "x$containerQty",
                                      style: const TextStyle(
                                          color: Color(0xFFF9CF00),
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  child: FloatingActionButton(
                                    heroTag: "Add Containers",
                                    onPressed: () {
                                      setState(() {
                                        containerQty++;
                                      });
                                    },
                                    backgroundColor: const Color(0xFFF9CF00),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.add,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.04),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                                color: Color(0xFF272D2F),
                                border: Border(
                                    top: BorderSide(color: Colors.white))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Total Points Awarded",
                                    style: TextStyle(
                                        color: Color(0xFFF9CF00),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "${containerQty * 15 + cupQty * 5}",
                                    style: const TextStyle(
                                        color: Color(0xFFF9CF00),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    updatePoints('z5Gb53iruXOYERr7UPN1dEZ2O433', 100)
                        .then((value) => Navigator.pop(context));
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
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
  }
}
