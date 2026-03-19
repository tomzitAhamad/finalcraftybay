
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extension/utils_extension.dart';
import '../../../shared/widgets/inc_dec_button.dart';
import '../../../shared/widgets/product_favorite_button.dart';
import '../../../shared/widgets/product_rating.dart';
import '../widgets/color_picker.dart';
import '../widgets/priceAndAddToCardSection.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/size_picker.dart';

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
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImageCarousel(),Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: .start,
                    children: [
                      _buildTitleSection(),
                      ColorPicker(colors: ['Red','Black','White'], onChange: (String color) {  },),
                      SizedBox(height: 16,),
                      SizePicker(sizes: ['S','M','L','XL','XXL'], onChange: (String p1) {  },),
                      SizedBox(height: 16,),
                      Text('Description',style: context.textTheme.titleMedium,),
                      SizedBox(height: 16,),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever "
                          "since the 1500s, when an unknown printer took a galley of "
                          "type and scrambled it to make a type specimen book. It "
                          "has survived not only five centuries, but also the leap "
                          "into electronic typesetting, remaining essentially unchanged. "
                          "It was popularised in the 1960s with the release of Letraset "
                          "sheets containing Lorem Ipsum passages, and more recently with desktop publishing"
                          " software like Aldus PageMaker including versions of Lorem Ipsum.",style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.grey
                      ),)
                  
                  
                    ],
                  ),
                )
              ],
            ),
          )),
          PriceAndAddToCardSection(price: 100, onTapAddToCard: () {  },)
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
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
                  );
  }
}






