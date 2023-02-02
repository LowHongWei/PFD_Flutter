// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/currentOrder.dart';
import 'package:pfd_flutter/error404.dart';
import 'package:pfd_flutter/foodClubVendors.dart';
import 'package:pfd_flutter/givePoints.dart';
import 'package:pfd_flutter/profile.dart';
import 'package:pfd_flutter/qrCode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfd_flutter/redemption.dart';
import 'package:pfd_flutter/vendorLandingPage.dart';
import 'main_start.dart';
import 'package:pfd_flutter/register.dart';
import 'package:pfd_flutter/appUser.dart';
import 'package:pfd_flutter/appVendor.dart';

class CanteenPage extends StatefulWidget {
  const CanteenPage({super.key});

  @override
  State<CanteenPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<CanteenPage> {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  String name = 'no data';
  int? points;
  String? uid;
  User? fUser;

  Future fetchUserData() async {
    fUser = fAuth.currentUser!;
    uid = fUser!.uid;

    await fStore.collection('Users').doc(fUser!.uid).get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['name'];
          points = snapshot.data()!['points'];
        });
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
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04,
                horizontal: MediaQuery.of(context).size.width * 0.08,
              ),
              child: const SizedBox(
                width: 340,
                child: Text(
                  "Welcome, $name",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Canteens',
                          style: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9CF00),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                FirebaseAuth.instance.signOut().then((value) =>
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainStart())));
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                child: Image.asset(
                                  'images/MKP_Button.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Makan Place',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9CF00),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Error404(),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                child: Image.asset(
                                  'images/Munch_Button.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Munch',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9CF00),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodClubVendors(),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                child: Image.asset(
                                  'images/FC_Button.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Food Club',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}


//   Future fetchUserData() async {
//     User fUser = fAuth.currentUser!;
//     AppUser user;

//     fStore.collection('Users').doc(fUser.uid).get().then((value) {
//       name = value.get('name');
//     });
//   }
// }
