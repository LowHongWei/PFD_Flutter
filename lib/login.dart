import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/canteenPage.dart';
import 'package:pfd_flutter/main.dart';
import 'package:pfd_flutter/register.dart';
import 'package:pfd_flutter/main_menu.dart';
import 'package:pfd_flutter/main_start.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              padding: EdgeInsets.all(20),
              child: SizedBox(
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
                height: MediaQuery.of(context).size.height * 0.68,
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
                    SizedBox(
                      width: 320,
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(
                            color: Color(0xFFF9CF00),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF9CF00), width: 2),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            hintText: "Email"),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextField(
                        controller: passwordController,
                        style: const TextStyle(
                            color: Color(0xFFF9CF00),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: const InputDecoration(
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
                            // FirebaseAuth.instance
                            //     .createUserWithEmailAndPassword(
                            //         email: emailController.text.trim(),
                            //         password: passwordController.text.trim());
                            // login;
                            //
                            signIn().whenComplete(() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainStart())));
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
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

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => false);
  }







}
