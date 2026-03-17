
import 'package:finalcrafty/app/app_colors.dart';
import 'package:finalcrafty/app/extension/utils_extension.dart';
import 'package:finalcrafty/features/products/presentation/widgets/product_image_carousel.dart';
import 'package:finalcrafty/features/shared/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/product_favorite_button.dart';
import '../../../shared/widgets/product_rating.dart';
import '../widgets/priceAndAddToCardSection.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name='product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),

      ),
      body: Column(
        children: [
          Expanded(child: Column(
            children: [
              ProductImageCarousel(),Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(

                  children: [
                    Row(
                      spacing: 8,
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text('Nike 2026 - New year special edition',style: context.textTheme.titleMedium?.copyWith(
                              color: Colors.black87
                            ),),
                            Row(

                              children: [
                                ProductRating(rating: '4.7',),
                                TextButton(onPressed: (){}, child: Text('Reviews',style: TextStyle(
                                  color: AppColors.themeColor
                                ),)),
                                ProductFavoriteButton()
                              ],
                            )

                          ],
                        )),
                        IncDecButton(onChange: (int value) {  },)
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
          PriceAndAddToCardSection(price: 100, onTapAddToCard: () {  },)
        ],
      ),
    );
  }
}






