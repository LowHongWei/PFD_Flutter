import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/landingPage.dart';
import 'package:pfd_flutter/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pfd_flutter/main_start.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String gender = 'Male';
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final studentIdController = TextEditingController();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();
  final fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    studentIdController.dispose();
    birthdayController.dispose();
    emailController.dispose();
    nameController.dispose();
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
        child: Expanded(
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        controller: nameController,
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
                            hintText: "Name"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 2
                            ? 'Enter min 2 characters'
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min 6 characters'
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        controller: studentIdController,
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
                            hintText: "StudentID"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 10
                            ? 'Invalid student id'
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 320,
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: const Color(0xFFF9CF00),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Male",
                                  style: TextStyle(
                                      color: Color(0xFFF9CF00),
                                      fontWeight: FontWeight.bold),
                                ),
                                Radio(
                                    value: "Male",
                                    groupValue: gender,
                                    onChanged: (value) => {
                                          setState(() {
                                            gender = "Male";
                                          })
                                        }),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Female",
                                  style: TextStyle(
                                    color: Color(0xFFF9CF00),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Radio(
                                    value: "Female",
                                    groupValue: gender,
                                    onChanged: (value) => {
                                          setState(() {
                                            gender = "Female";
                                          })
                                        }),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Others",
                                  style: TextStyle(
                                    color: Color(0xFFF9CF00),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Radio(
                                    value: "Others",
                                    groupValue: gender,
                                    onChanged: (value) => {
                                          setState(() {
                                            gender = "Others";
                                          })
                                        }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        controller: birthdayController,
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
                            hintText: "Birthday (dd/mm/yyyy)"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 10
                            ? 'Invalid birthday'
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
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
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9CF00),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            signUp().then((value) => createUser().then(
                                (value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainStart()))));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  // Future signup() async {
  //   await fAuth.createUserWithEmailAndPassword(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   );
  // }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => false);
  }

  Future createUser() async {
    String uid = fAuth.currentUser!.uid;
    final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);

    final json = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'gender': gender,
      'studentID': studentIdController.text.trim(),
      'birthday': birthdayController.text.trim(),
    };

    docUser.set(json);
  }


}
