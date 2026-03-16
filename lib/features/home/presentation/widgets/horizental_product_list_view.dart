import 'package:flutter/cupertino.dart';

import '../../../shared/widgets/product_card.dart';

class HorizentalProductListView extends StatelessWidget {
  const HorizentalProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,

      child: ListView.builder(
        itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){

            return ProductCard();
          }),
    );
  }
}