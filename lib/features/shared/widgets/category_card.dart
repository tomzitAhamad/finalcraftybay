
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../catagory/data/model/category_model.dart';
import '../../products/presentation/screens/product_list_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: categoryModel,
        );
      },
      child: Column(
        crossAxisAlignment: .center,
        spacing: 4,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(30),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryModel.icon,
              height: 48,
              width: 48,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          Text(
            categoryModel.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w600,
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}