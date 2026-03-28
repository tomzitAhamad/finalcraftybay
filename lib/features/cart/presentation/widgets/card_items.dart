
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constrain.dart';
import '../../../../app/extension/utils_extension.dart';
import '../../../shared/widgets/inc_dec_button.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: .symmetric(horizontal: 16,vertical: 8),
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                height: 90,
                width: 90,
                AssetPaths.dummyImagePng),
          ),
          Expanded(child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment:.start,
                    children: [
                      Text('Product Name',style: context.textTheme.titleMedium,),
                      Text('Color : Red size : XL')
                    ],
                  )),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline))
                ],
              ),
              SizedBox(height: 9,),
              Row(
                mainAxisAlignment:.spaceBetween,
                children: [
                  Text('${Constrain.takaSign}180',style: TextStyle(
                      color: AppColors.themeColor,
                      fontSize: 18,
                      fontWeight: .w600
                  ),),
                  IncDecButton(onChange: (int value){})
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}