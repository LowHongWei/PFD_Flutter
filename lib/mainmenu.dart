import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9CF00),
      appBar: AppBar(
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
          children: [
            const SizedBox(
              height: 60,
            ),
            const Image(
              image: AssetImage('images/burger.png'),
              width: 300,
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                width: 320,
                child: Text(
                  "Food Ordering",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text(
                    'Log In',
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
              width: 300,
              height: 40,
              child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 2.0, color: Colors.black),
                      shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
