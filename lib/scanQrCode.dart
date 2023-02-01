import 'dart:io' as IO;

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: 'QR');
  bool started = false;
  QRViewController? controller;
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
            height: MediaQuery.of(context).size.height * 0.05,
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
                onPressed: () {}, child: const Text('Redeem Voucher!'))
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
