import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/canteenPage.dart';
import 'package:pfd_flutter/login.dart';
import 'package:pfd_flutter/register.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class Redemption extends StatefulWidget {
  const Redemption({super.key});

  @override
  State<Redemption> createState() => _RedemptionState();
}

class _RedemptionState extends State<Redemption> {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  String name = '';
  var points = 0;
  int saved = 0;
  String? uid;
  User? fUser;

  Future fetchUserData() async {
    uid = fAuth.currentUser!.uid;

    await fStore.collection('Users').doc(uid).get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          points = snapshot.data()!['points'];
          saved = snapshot.data()!['saved'];
        });
      }
    });
  }

  Future redeemVoucher(int amount) async {
    uid = fAuth.currentUser!.uid;
    DocumentReference doc = fStore.collection('Users').doc(uid);

    await fStore.collection('Users').doc(uid).get().then((snapshot) {
      if (snapshot.exists) {
        points = snapshot.data()!['points'];
        if (points < amount) {
          int diff = amount - points;
          return Toast.show("$diff more points to redeem voucher",
              duration: Toast.lengthShort, gravity: Toast.bottom);
        } else {
          doc.update({'saved': FieldValue.increment(amount)});
          doc.update({'points': points - amount});
        }
      }
    });
  }

  @override
  void initState() {
    // fAuth.signOut();
    fetchUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Feedback.forTap(context);
            Navigator.pop(context);
          },
          child: Image.asset(
            'images/BackArrowYellow.png',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'images/BankSolidYellow.png',
                  height: 150,
                  width: 400,
                ),
              ],
            ),
            Text(
              'Saved: ${NumberFormat.simpleCurrency(locale: 'en_SG', decimalDigits: 2).format(saved / 500)}',
              style: const TextStyle(color: Color(0xFFF9CF00), fontSize: 25),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                width: 320,
                child: Text(
                  "$points Points",
                  style: const TextStyle(
                      color: Color(0xFFF9CF00),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9CF00),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            redeemVoucher(50).then((value) {
                              fetchUserData();
                            });
                          },
                          child: const Text(
                            'Redeem 10C',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Padding(padding: EdgeInsets.all(16)),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9CF00),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            redeemVoucher(100).then((value) {
                              fetchUserData();
                            });
                          },
                          child: const Text(
                            'Redeem 20C',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9CF00),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            redeemVoucher(250).then((value) {
                              fetchUserData();
                            });
                          },
                          child: const Text(
                            'Redeem 50C',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Padding(padding: EdgeInsets.all(16)),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9CF00),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            redeemVoucher(500).then((value) {
                              fetchUserData();
                            });
                          },
                          child: const Text(
                            'Redeem 100C',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
