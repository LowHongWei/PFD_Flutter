import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/redemption.dart';
import 'package:pfd_flutter/scanQrCode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RedeemQR extends StatefulWidget {
  final int points;
  const RedeemQR({super.key, required this.points});

  @override
  State<RedeemQR> createState() => _RedeemQRState();
}

class _RedeemQRState extends State<RedeemQR> {
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
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              width: 340,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: Color(0xFF272D2F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFF9CF00),
                            width: 3,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                            vertical:
                                MediaQuery.of(context).size.height * 0.03),
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Center(
                            child: Text(
                              'Redemption QR Code',
                              style: TextStyle(
                                  color: Color(0xFFF9CF00),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: QrImage(
                        data: widget.points.toString(),
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.width * 0.86,
                      )),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
