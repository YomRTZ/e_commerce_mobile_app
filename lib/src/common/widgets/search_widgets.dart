import 'package:flutter/material.dart';

class SearchWidgets extends StatefulWidget {
  const SearchWidgets({super.key});

  @override
  State<SearchWidgets> createState() => _SearchWidgetsState();
}

class _SearchWidgetsState extends State<SearchWidgets> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      // controller:searchController ,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        prefixIcon: const Icon(Icons.search),
        hintText: "Search Explore,collect,play!",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
