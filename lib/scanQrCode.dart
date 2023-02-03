import 'dart:io' as IO;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/givePoints.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  String uid = '';
  User? fUser;
  String name = '';
  var points = 0;
  int credit = 0;

  Future fetchUserData() async {
    fUser = fAuth.currentUser!;
    uid = fUser!.uid;

    await fStore.collection('Users').doc(fUser!.uid).get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['name'];
          points = snapshot.data()!['points'];
          credit = snapshot.data()!['credit'];
        });
      }
    });
  }

  Future updateVendorPoints(String vendorUid, int addPoints) async {
    DocumentReference doc = fStore.collection('Users').doc(vendorUid);
    fUser = fAuth.currentUser!;
    uid = fUser!.uid;
    doc.update({'points': FieldValue.increment(addPoints)});
  }

  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: 'QR');
  bool started = false;
  QRViewController? controller;
  @override
  void initState() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (IO.Platform.isAndroid) {}
    await controller!.pauseCamera();
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult()),
          Positioned(
            top: 40,
            child: buildControlButtons(),
          )
        ],
      ),
    );
  }

  Widget buildControlButtons() => Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.09,
            color: Colors.white,
            child: started
                ? IconButton(
                    icon: FutureBuilder(
                      future: controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return const Icon(Icons.switch_camera_outlined);
                        } else {
                          return Container();
                        }
                      },
                    ),
                    onPressed: () async {
                      await controller?.flipCamera();
                    },
                  )
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        started = true;
                      });
                      await controller?.flipCamera();
                    },
                    child: const Text(
                      'Start Scanning!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
          )
        ],
      );

  Widget buildResult() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(8)),
        child: barcode != null
            ? ElevatedButton(
                onPressed: () {
                  print(barcode!.code.toString()[0]);
                  if (barcode!.code.toString() != '50' &&
                      barcode!.code.toString() != '100' &&
                      barcode!.code.toString() != '250' &&
                      barcode!.code.toString() != '500') {
                    //S10203927J
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GivePoints(
                          sID: barcode!.code.toString(),
                        ),
                      ),
                    );
                  } else {
                    updateVendorPoints(uid, int.parse(barcode!.code.toString()))
                        .then((value) => Navigator.pop(context));
                    //add points
                  }
                },
                child: const Text('Redeem Voucher!'))
            : const Text(
                'Scan a code!',
                maxLines: 3,
              ),
      );
  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: const Color(0xFFF9CF00),
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
