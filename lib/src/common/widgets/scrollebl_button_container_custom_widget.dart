import 'package:flutter/material.dart';

class CircularScrolleblWidget extends StatefulWidget {
  final String texts;
  final IconData icons;
  const CircularScrolleblWidget(
      {super.key, required this.icons, required this.texts});

  @override
  State<CircularScrolleblWidget> createState() =>
      _CircularScrolleblWidgetState();
}

class _CircularScrolleblWidgetState extends State<CircularScrolleblWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width:1)
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icons),
          const SizedBox(width: 10),
          Text(widget.texts,style: const TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
