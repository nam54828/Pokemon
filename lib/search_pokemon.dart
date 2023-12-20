import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search Pokemon",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabled: true,
          prefixIcon: Icon(
            Icons.zoom_out_outlined,
            color: Colors.white,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
