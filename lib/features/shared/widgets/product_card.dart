import 'package:finalcrafty/app/constrain.dart';
import 'package:finalcrafty/features/shared/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../app/extension/utils_extension.dart';
import '../../products/data/model/product_model.dart';
import '../../products/presentation/screens/product_details_screen.dart';
import '../../wishlist/provider/add_wish_list_provider.dart';
import 'network_image_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: productModel.id,
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 4,
        shadowColor: AppColors.themeColor.withAlpha(50),
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              // IMAGE
              Container(
                width: 140,
                height: 120,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(30),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: AppNetworkImage(urls: productModel.photos),
              ),

              const SizedBox(height: 6),

              // TITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  productModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall,
                ),
              ),

              const SizedBox(height: 6),

              // PRICE + RATING + WISHLIST
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    // PRICE
                    Expanded(
                      child: Text(
                        '${Constrain.takaSign}${productModel.currentPrice}',
                        style: context.textTheme.titleSmall?.copyWith(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 4),

                    // RATING
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 2),
                      ],
                    ),
                    Text(
                      '4.6',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(width: 6),

                    // WISHLIST BUTTON
                    Consumer<AddWishListProvider>(
                      builder: (context, provider, _) {
                        final isLoading = provider.loadingProductIds
                            .contains(productModel.id);

                        return GestureDetector(
                          onTap: isLoading
                              ? null
                              : () async {
                            final success =
                            await provider.addToWishList(
                              productModel.id,
                            );

                            if (success) {
                              showSnackBarMessage(
                                context,
                                'Added in wishlist',
                              );
                            } else {
                              showSnackBarMessage(
                                context,
                                provider.errorMessage ??
                                    'Something went wrong',
                              );
                            }
                          },
                          child: Container(
                            width: 26,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: isLoading
                                ? const SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}