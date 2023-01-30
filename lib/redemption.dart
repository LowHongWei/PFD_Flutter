import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/landingPage.dart';
import 'package:pfd_flutter/login.dart';
import 'package:pfd_flutter/register.dart';
import 'package:sizer/sizer.dart';

class Redemption extends StatelessWidget {
  const Redemption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9CF00),
        elevation: 0,
        title: Image.asset(
          'images/IconYellow.png',
          fit: BoxFit.cover,
          height: 200,
          width: 200,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'images/BigBankYellow.png',
                  height: 100,
                  width: 300,
                ),
                const Text(
                  'Saved',
                  style: TextStyle(color: Color(0xFFF9CF00), fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                width: 320,
                child: Text(
                  "Points",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 320,
                child: Text(
                  "Nothing brings people together like good food!",
                  style: TextStyle(fontSize: 15),
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
                      height: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: const Text(
                            'Redeem 10',
                            style: TextStyle(
                                color: Color(0xFFF9CF00),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2.0, color: Colors.black),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: const Text(
                            'Redeem 20',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: const Text(
                            'Redeem 50',
                            style: TextStyle(
                                color: Color(0xFFF9CF00),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2.0, color: Colors.black),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                          child: const Text(
                            'Redeem 100',
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
