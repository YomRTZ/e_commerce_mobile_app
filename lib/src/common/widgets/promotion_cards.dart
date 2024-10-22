import 'package:e_commerce_app/src/presentation/screens/products.dart';
import 'package:flutter/material.dart';

class promotionCards extends StatefulWidget {
  const promotionCards({super.key});

  @override
  State<promotionCards> createState() => _promotionCardsState();
}

class _promotionCardsState extends State<promotionCards> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[200],
      width: screenWidth,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "By your side in any season",
              style: TextStyle(fontSize: 30.0),
            ),
            const Text(
              "Enjoy with your products, parts and more.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductsWidget()),
                    );
                  },
                  child: const Text(
                    "Find your products",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/download.jpg')
          ],
        ),
      ),
    );
  }
}
