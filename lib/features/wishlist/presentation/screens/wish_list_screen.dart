
import 'package:finalcrafty/features/shared/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});



  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish list'),
      ),
      body: GridView.builder(
          itemCount: 10,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4,
              crossAxisCount: 3), itemBuilder: (context,index){
        // return FittedBox(child: ProductCard());
      }),
    );
  }
}
