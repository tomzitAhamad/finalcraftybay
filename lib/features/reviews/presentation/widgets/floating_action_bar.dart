import 'package:finalcrafty/features/reviews/presentation/screens/create_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class FloatingActionBar extends StatelessWidget {
  const FloatingActionBar({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10), // controls size
        decoration: BoxDecoration(
          shape: BoxShape.circle, // 🔥 makes it circular
          color: AppColors.themeColor, // 🔥 green background

        ),
        child: Icon(
          fontWeight: FontWeight.w900,
          size: 35,
          Icons.add,
          color: Colors.white, // white icon
        ),
      ),
    );
  }
}
