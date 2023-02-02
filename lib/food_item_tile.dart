import 'package:flutter/material.dart';
import 'package:pfd_flutter/Cart.dart';
import 'package:pfd_flutter/food_detail.dart';

class FoodItemTile extends StatelessWidget {
  final String itemName;
  final String itemImagePath;
  final double itemPrice;
  final List itemOption;

  const FoodItemTile(
      {super.key,
      required this.itemName,
      required this.itemImagePath,
      required this.itemPrice,
      required this.itemOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color(0xFFF9CF00),
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetails(
                            foodImgPath: itemImagePath,
                            foodName: itemName,
                            foodOption: itemOption,
                            foodPrice: itemPrice,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                      ),
                      child: Image.asset(
                        itemImagePath,
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.18,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: Text(
                          itemName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: Text(
                          "\$" + itemPrice.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
