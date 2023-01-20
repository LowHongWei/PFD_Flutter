import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/profile.dart';
import 'package:pfd_flutter/qrCode.dart';

import 'main_start.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
            const Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                width: 340,
                child: Text(
                  textAlign: TextAlign.start,
                  "Welcome, John Doe!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.79,
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
                                FirebaseAuth.instance.signOut().then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainStart())); //temp code
                                });
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
                              onTap: () {},
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
                                    builder: (context) => const QrCode(),
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
