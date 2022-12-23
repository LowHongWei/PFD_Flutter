import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String gender = 'Male';
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
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
                const SizedBox(
                  width: 320,
                  child: TextField(
                    style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF9CF00), width: 2),
                        ),
                        hintStyle: TextStyle(
                          color: Color(0xFFF9CF00),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        hintText: "Name"),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                          borderSide:
                              BorderSide(color: Color(0xFFF9CF00), width: 2),
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
                  height: 15,
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
                          borderSide:
                              BorderSide(color: Color(0xFFF9CF00), width: 2),
                        ),
                        hintStyle: TextStyle(
                          color: Color(0xFFF9CF00),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        hintText: "StudentID"),
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
                const SizedBox(
                  width: 320,
                  child: TextField(
                    style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF9CF00), width: 2),
                        ),
                        hintStyle: TextStyle(
                          color: Color(0xFFF9CF00),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        hintText: "Birthday (dd/mm/yyyy)"),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                          borderSide:
                              BorderSide(color: Color(0xFFF9CF00), width: 2),
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
                  height: 65,
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF9CF00),
                          shape: const StadiumBorder()),
                      onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
