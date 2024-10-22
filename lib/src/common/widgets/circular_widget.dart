import 'package:flutter/material.dart';

class CircularWidget extends StatefulWidget {
  final String imageUrl;
  final String categoryName;
  const CircularWidget(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  State<CircularWidget> createState() => _CircularWidgetState();
}

class _CircularWidgetState extends State<CircularWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.black),
                color: Colors.grey[200],
                image: DecorationImage(
                    image: NetworkImage(widget.imageUrl), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 10),
          Text(
            widget.categoryName,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
