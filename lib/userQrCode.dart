import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/redemption.dart';
import 'package:pfd_flutter/scanQrCode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserQrCode extends StatefulWidget {
  const UserQrCode({super.key});

  @override
  State<UserQrCode> createState() => _UserQrCodeState();
  static bool redeemVoucher = false;
}

class _UserQrCodeState extends State<UserQrCode> {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  String uid = '';

  User? fUser;
  fetchUserData() {
    fUser = fAuth.currentUser!;
    uid = fUser!.uid;

    fStore.collection('Users').doc(fUser!.uid).get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          uid = snapshot.data()!['studentID'];
        });
      }
    });
  }

  @override
  void initState() {
    fetchUserData();
    super.initState();
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
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            UserQrCode.redeemVoucher = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Redemption(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.41,
                          padding: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: UserQrCode.redeemVoucher
                                    ? Color(0xFFF9CF00)
                                    : Colors.black,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Redeem Voucher",
                              style: TextStyle(
                                  color: UserQrCode.redeemVoucher
                                      ? const Color(0xFFF9CF00)
                                      : Color.fromARGB(255, 255, 244, 188),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            UserQrCode.redeemVoucher = false;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.41,
                          padding: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: !UserQrCode.redeemVoucher
                                ? const Color(0xFFF9CF00)
                                : Colors.black,
                            width: 3.0,
                          ))),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Earn Points",
                              style: TextStyle(
                                  color: !UserQrCode.redeemVoucher
                                      ? const Color(0xFFF9CF00)
                                      : const Color.fromARGB(
                                          255, 255, 244, 188),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: UserQrCode.redeemVoucher == false
                        ? QrImage(
                            data: uid,
                            version: QrVersions.auto,
                            size: MediaQuery.of(context).size.width * 0.86,
                          )
                        : Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.86,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "Earn Points Not Chosen. Click the above 'Earn Points to get QR Code'",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
