import 'package:flutter/material.dart';

class CurrentOrder extends StatefulWidget {
  const CurrentOrder({super.key});

  @override
  State<CurrentOrder> createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9CF00),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.07),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.85,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(0xFF272D2F),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Current Orders",
                      style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.85,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Color(0xFF272D2F),
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.07),
                          child: const Text(
                            "Item",
                            style: TextStyle(
                                color: Color(0xFFF9CF00),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.07),
                        child: const Text(
                          "Qty",
                          style: TextStyle(
                              color: Color(0xFFF9CF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.56,
              width: MediaQuery.of(context).size.width * 0.85,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: const Text(
                                "Item Name 1",
                                style: TextStyle(
                                    color: Color(0xFFF9CF00), fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: const Text(
                              "Item QTY 1",
                              style: TextStyle(
                                  color: Color(0xFFF9CF00), fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: const Text(
                                "Item Name 1",
                                style: TextStyle(
                                    color: Color(0xFFF9CF00), fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: const Text(
                              "Item QTY 1",
                              style: TextStyle(
                                  color: Color(0xFFF9CF00), fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: const Text(
                                "Item Namdfsdfe 2",
                                style: TextStyle(
                                    color: Color(0xFFF9CF00), fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: const Text(
                              "Item cd 2",
                              style: TextStyle(
                                  color: Color(0xFFF9CF00), fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.80,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF272D2F)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(
                        color: Color(0xFFF9CF00),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
