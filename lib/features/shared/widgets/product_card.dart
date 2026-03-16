
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../../app/asset_paths.dart';
import '../../../app/constrain.dart';
import '../../../app/extension/utils_extension.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(

        color: Colors.white,
        elevation: 4,
        shadowColor: AppColors.themeColor.withAlpha(50),
        child: Column(
          children: [
            Container(
              padding: .all(8),
              height: 120,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: .circular(8),topRight: .circular(8)),
                color: AppColors.themeColor.withAlpha(50),

              ),
              child: Image.asset(AssetPaths.dummyImagePng,fit:  BoxFit.scaleDown,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                spacing: 2,
                children: [
                  Text('Nike shoe -New addition 2025',maxLines: 1,style: TextStyle(overflow: .ellipsis),),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text('${Constrain.takaSign}120',style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.themeColor
                      ),),
                      Wrap(
                        crossAxisAlignment: .center,
                        children: [
                          Icon(Icons.star,size: 18,color: Colors.amber,),
                          Text('4.6',style: context.textTheme.titleMedium?.copyWith(
                              color: Colors.grey
                          ),),
                        ],
                      ),
                      Container(
                        padding: .all(2),
                        decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: .circular(4)
                        ),
                        child: Icon(Icons.favorite_outline,color: Colors.white,size: 16,),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}