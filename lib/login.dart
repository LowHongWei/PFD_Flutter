import 'package:flutter/material.dart';
import 'package:pfd_flutter/landingPage.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9CF00),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9CF00),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Feedback.forTap(context);
            Navigator.pop(context);
          },
          child: Image.asset(
            'images/BackArrowBlack.png',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: 340,
                child: Text(
                  textAlign: TextAlign.start,
                  "Welcome Back!",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    const SizedBox(
                      width: 320,
                      child: TextField(
                        style: TextStyle(
                            color: Color(0xFFF9CF00),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF9CF00), width: 2),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            hintText: "Username"),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const SizedBox(
                      width: 320,
                      child: TextField(
                        style: TextStyle(
                            color: Color(0xFFF9CF00),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF9CF00), width: 2),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            hintText: "Password"),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9CF00),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            //To be replaced with like some firebase code or smth
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandingPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2.0, color: Color(0xFFF9CF00)),
                              shape: const StadiumBorder()),
                          onPressed: () {},
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Color(0xFFF9CF00),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Text(
                          "If you don't have an account",
                          style: TextStyle(color: Color(0xFFF9CF00)),
                        ),
                      ),
                    )
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
