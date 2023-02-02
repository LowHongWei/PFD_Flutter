import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/canteenPage.dart';
import 'package:pfd_flutter/login.dart';
import 'package:pfd_flutter/main.dart';
import 'package:pfd_flutter/register.dart';
import 'package:pfd_flutter/vendorlandingPage.dart';
import 'package:sizer/sizer.dart';
import 'package:pfd_flutter/main_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'landingPage.dart';

class MainStart extends StatelessWidget {
  const MainStart({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final fAuth = FirebaseAuth.instance;
            final fStore = FirebaseFirestore.instance;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            } else if (snapshot.hasData) {
              // fAuth.signOut();

              if (snapshot.data!.email == "john@gmail.com")
                return VendorLandingPage();
              return LandingPage();
              // fAuth.signOut();
            } else {
              return MainMenu();
            }
          }));
}
