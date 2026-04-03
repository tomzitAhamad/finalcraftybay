import 'package:flutter/cupertino.dart';

import '../../../shared/widgets/category_card.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
          scrollDirection: .horizontal,
          itemBuilder: (context,index)=>CategoryCard(),
          separatorBuilder: (_,__)=>SizedBox(width: 12,),
          itemCount: 10),
    );
  }
}