import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constrain.dart';
import '../../../../app/extension/utils_extension.dart';

class PriceAndAddToCardSection extends StatelessWidget {
  const PriceAndAddToCardSection({
    super.key, required this.price, required this.onTapAddToCard,
  });
  final double price;
  final VoidCallback onTapAddToCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: .only(
              topLeft: .circular(16),
              topRight: .circular(16)
          ),
          color: AppColors.themeColor.withAlpha(30)
      ),
      padding: EdgeInsets.all(26),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Price',style: context.textTheme.bodyLarge,),
              Text('${Constrain.takaSign}$price',style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor
              ),)
            ],
          ),
          FilledButton(
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromWidth(120)
              ),
              onPressed: onTapAddToCard, child: Text('Add to card'))
        ],
      ),
    );
  }
}