import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey.withAlpha(50),
          hintText: 'Search',
          enabledBorder:OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder:OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)
          )
      ),
    );
  }
}