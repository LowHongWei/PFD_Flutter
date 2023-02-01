import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/canteenPage.dart';
import 'package:pfd_flutter/login.dart';
import 'package:pfd_flutter/register.dart';
import 'package:sizer/sizer.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9CF00),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF9CF00),
        elevation: 0,
        title: Image.asset(
          'images/IconBlack.png',
          fit: BoxFit.cover,
          height: 200,
          width: 200,
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 60,
            ),
            Image(
              image: AssetImage('images/burger.png'),
              width: 300,
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                width: 320,
                child: Text(
                  "Error 404",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 320,
                child: Text(
                  "The page that you are looking for is under construction. Please try again later :)",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
