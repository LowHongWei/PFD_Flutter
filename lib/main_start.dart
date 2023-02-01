import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/landingPage.dart';
import 'package:pfd_flutter/login.dart';
import 'package:pfd_flutter/register.dart';
import 'package:sizer/sizer.dart';
import 'package:pfd_flutter/main_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainStart extends StatelessWidget {
  const MainStart({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            } else if (snapshot.hasData) {
              return const LandingPage();
            } else {
              return const MainMenu();
            }
          }));

  // )
  //  body:Center(
  //   child: Column(
  //     children: [
  //       const SizedBox(
  //         height: 60,
  //       ),
  //       const Image(
  //         image: AssetImage('images/burger.png'),
  //         width: 300,
  //       ),
  //       const SizedBox(height: 25),
  //       const Padding(
  //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //         child: SizedBox(
  //           width: 320,
  //           child: Text(
  //             "Food Ordering",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  //             textAlign: TextAlign.start,
  //           ),
  //         ),
  //       ),
  //       const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: SizedBox(
  //           width: 320,
  //           child: Text(
  //             "Nothing brings people together like good food!",
  //             style: TextStyle(fontSize: 15),
  //             textAlign: TextAlign.start,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 40,
  //       ),
  //       SizedBox(
  //         width: 300,
  //         height: 40,
  //         child: ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.black,
  //                 shape: const StadiumBorder()),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => const SignIn(),
  //                 ),
  //               );
  //             },
  //             child: const Text(
  //               'Log In',
  //               style: TextStyle(
  //                   color: Color(0xFFF9CF00),
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             )),
  //       ),
  //       const SizedBox(
  //         height: 13,
  //       ),
  //       SizedBox(
  //         width: 300,
  //         height: 40,
  //         child: OutlinedButton(
  //             style: ElevatedButton.styleFrom(
  //                 side: const BorderSide(width: 2.0, color: Colors.black),
  //                 shape: const StadiumBorder()),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => Register(),
  //                 ),
  //               );
  //             },
  //             child: const Text(
  //               'Register',
  //               style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             )),
  //       )
  //     ],
  //   ),
  // ),
}
