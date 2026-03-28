
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constrain.dart';
import '../../../../app/extension/utils_extension.dart';

class TotalPriceAndCheckOutSection extends StatelessWidget {
  const TotalPriceAndCheckOutSection({
    super.key, required this.totalPrice, required this.onTapCheckOutCart,
  });
  final double totalPrice;
  final VoidCallback onTapCheckOutCart;

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
              Text('Total Price',style: context.textTheme.bodyLarge,),
              Text('${Constrain.takaSign}$totalPrice',style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor
              ),)
            ],
          ),
          FilledButton(
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromWidth(120)
              ),
              onPressed: onTapCheckOutCart, child: Text('Checkout'))
        ],
      ),
    );
  }
}