import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String title;
  // final String? brand;
  final String price;
  final String thumbnail;
  const CardWidget(
      {super.key,
      required this.title,
      // required this.brand,
      required this.price,
      required this.thumbnail});

  @override
  State<CardWidget> createState() => _CardsState();
}

class _CardsState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 170,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.thumbnail))),
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "brand",
            style: TextStyle(fontSize: 20,color: Colors.grey[500]),
          ),
          Text(
            widget.price,
            style: TextStyle(fontSize: 20,color: Colors.grey[500]),
          )
        ],
      ),
    );
  }
}
