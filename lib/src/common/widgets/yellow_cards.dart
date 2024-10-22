import 'package:flutter/material.dart';

class PromotionCards extends StatelessWidget {
  const PromotionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.yellow[600],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth*0.5,
              child: const Text(
          
                "Collectibles Card games",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
          ),
              Container(
                width: constraints.maxWidth*0.4,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/download (1).jpg"),
                        fit: BoxFit.fill)),
              )
            ],
          ),
        ),
        //
      );
    });
  }
}
