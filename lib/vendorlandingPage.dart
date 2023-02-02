import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfd_flutter/main_menu.dart';
import 'package:pfd_flutter/main_start.dart';
import 'package:pfd_flutter/profile.dart';
import 'package:pfd_flutter/qrCode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'currentOrder.dart';
import 'scanQrCode.dart';

class VendorLandingPage extends StatefulWidget {
  const VendorLandingPage({super.key});

  @override
  State<VendorLandingPage> createState() => _VendorLandingPageState();
}

class _VendorLandingPageState extends State<VendorLandingPage> {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final fStore = FirebaseFirestore.instance;
  String name = '';
  int? points;
  String? uid;
  User? fUser;

  @override
  void initState() {
    // fAuth.signOut();
    uid = fAuth.currentUser!.uid;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9CF00),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF9CF00),
        elevation: 0,
        title: Image.asset(
          'images/IconBlack.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrCode(),
                ),
              );
            },
            icon: Image.asset('images/qr-code black.png'),
          ),
          IconButton(
            icon: Image.asset('images/user.png'),
            iconSize: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                          textAlign: TextAlign.start,
                          "Welcome,",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        StreamBuilder(
                            stream:
                                fStore.collection('Users').doc(uid).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                name = snapshot.data!.get('name');
                                return Text(
                                  textAlign: TextAlign.start,
                                  name, //Need to do backend
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return const Text("no data");
                              }
                            }),
                        // Text(
                        //   textAlign: TextAlign.start,
                        //   "Food Club!", //Need to do backend
                        //   style: TextStyle(
                        //       fontSize: 30, fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.79,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: StreamBuilder(
                            stream:
                                fStore.collection('Users').doc(uid).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                // AppUser appUser = new Appuser{}
                                points = snapshot.data!.get('points');
                                return Text(
                                  'You have $points points', //Need to do backend
                                  style: const TextStyle(
                                      color: Color(0xFFF9CF00),
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                );
                              } else {
                                return const Text("no data");
                              }
                            }),
                        // Text(
                        //   'You have 200 points', //Need to do backend
                        //   style: TextStyle(
                        //       color: Color(0xFFF9CF00),
                        //       fontSize: 40,
                        //       fontWeight: FontWeight.bold),
                        //   textAlign: TextAlign.center,
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9CF00),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ScanQR()),
                                );
                              },
                              // ignore: prefer_const_constructors
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(35),
                                ),
                                // ignore: prefer_const_constructors
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  child: const Text(
                                    'Scan QR Code',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9CF00),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (const MainStart())),
                                );
                              },
                              // ignore: prefer_const_constructors
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                // ignore: prefer_const_constructors
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  child: const Text(
                                    'Claim all points',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9CF00),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CurrentOrder()),
                                );
                              },
                              // ignore: prefer_const_constructors
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                // ignore: prefer_const_constructors
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  child: const Text(
                                    'Current orders',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

// class VendorLandingPage extends StatelessWidget {
//   const VendorLandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color(0xFFF9CF00),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color(0xFFF9CF00),
//         elevation: 0,
//         title: Image.asset(
//           'images/IconBlack.png',
//           fit: BoxFit.cover,
//           height: MediaQuery.of(context).size.height * 0.08,
//           width: MediaQuery.of(context).size.width * 0.6,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const QrCode(),
//                 ),
//               );
//             },
//             icon: Image.asset('images/qr-code black.png'),
//           ),
//           IconButton(
//             icon: Image.asset('images/user.png'),
//             iconSize: 50,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ProfilePage(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width * 0.1,
//                   vertical: MediaQuery.of(context).size.height * 0.02),
//               child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 1,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       children: const [
//                         Text(
//                           textAlign: TextAlign.start,
//                           "Welcome,",
//                           style: TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           textAlign: TextAlign.start,
//                           "Food Club!", //Need to do backend
//                           style: TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.79,
//                 decoration: const BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(35),
//                     topRight: Radius.circular(35),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: MediaQuery.of(context).size.width * 0.1,
//                           vertical: MediaQuery.of(context).size.height * 0.02),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child:StreamBuilder(
//                     stream: fStore.collection('Users').doc(uid).snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         // AppUser appUser = new Appuser{}
//                         name = snapshot.data!.get('name');
//                         return Text(
//                           name,
//                           textAlign: TextAlign.start,
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         );
//                       } else {
//                         return const Text("no data");
//                       }
//                     }), 
//                         // Text(
//                         //   'You have 200 points', //Need to do backend
//                         //   style: TextStyle(
//                         //       color: Color(0xFFF9CF00),
//                         //       fontSize: 40,
//                         //       fontWeight: FontWeight.bold),
//                         //   textAlign: TextAlign.center,
//                         // ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       height: MediaQuery.of(context).size.height * 0.15,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                             color: const Color(0xFFF9CF00),
//                             borderRadius: BorderRadius.circular(18)),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const ScanQR()),
//                                 );
//                               },
//                               // ignore: prefer_const_constructors
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(35),
//                                 ),
//                                 // ignore: prefer_const_constructors
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical:
//                                           MediaQuery.of(context).size.height *
//                                               0.05),
//                                   child: const Text(
//                                     'Scan QR Code',
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       height: MediaQuery.of(context).size.height * 0.15,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                             color: const Color(0xFFF9CF00),
//                             borderRadius: BorderRadius.circular(18)),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           (const MainStart())),
//                                 );
//                               },
//                               // ignore: prefer_const_constructors
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(18),
//                                   topRight: Radius.circular(18),
//                                 ),
//                                 // ignore: prefer_const_constructors
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical:
//                                           MediaQuery.of(context).size.height *
//                                               0.05),
//                                   child: const Text(
//                                     'Claim all points',
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       height: MediaQuery.of(context).size.height * 0.15,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                             color: const Color(0xFFF9CF00),
//                             borderRadius: BorderRadius.circular(18)),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const CurrentOrder()),
//                                 );
//                               },
//                               // ignore: prefer_const_constructors
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(18),
//                                   topRight: Radius.circular(18),
//                                 ),
//                                 // ignore: prefer_const_constructors
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical:
//                                           MediaQuery.of(context).size.height *
//                                               0.05),
//                                   child: const Text(
//                                     'Current orders',
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
