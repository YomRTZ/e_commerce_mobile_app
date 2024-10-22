import 'package:flutter/material.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return null;
        
          // images
          //seller  and fav
        }));
  }
}
