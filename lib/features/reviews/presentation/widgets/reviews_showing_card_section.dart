
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extension/utils_extension.dart';

class ReviewsShowingCardSection extends StatelessWidget {
  const ReviewsShowingCardSection({
    super.key, required this.reviews,
  });
  final double reviews;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(

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
                Text('Reviews($reviews)',style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.black
                ),),

              ],
            ),

          ],
        ),
      ),
    );
  }
}