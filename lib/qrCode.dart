import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
  static bool redeemVoucher = true;
}

class _QrCodeState extends State<QrCode> {
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
                            QrCode.redeemVoucher = true;
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
                                color: QrCode.redeemVoucher
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
                                  color: QrCode.redeemVoucher
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
                            QrCode.redeemVoucher = false;
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
                            color: !QrCode.redeemVoucher
                                ? const Color(0xFFF9CF00)
                                : Colors.black,
                            width: 3.0,
                          ))),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Earn Points",
                              style: TextStyle(
                                  color: !QrCode.redeemVoucher
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
                  child: QrImage(
                    data: "1234567890", //Dummy
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.width * 0.86,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
