import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constrain.dart';
import '../../../products/data/model/product_model.dart';
import '../../../shared/widgets/network_image_widget.dart';
import '../../../shared/widgets/product_card.dart';
import '../../provider/wish_list_provider.dart';


class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/wish-list';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WishListProvider>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),

      body: Consumer<WishListProvider>(
        builder: (context, provider, _) {

          // LOADING
          if (provider.getWishListInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          // EMPTY STATE
          if (provider.wishList.isEmpty) {
            return const Center(child: Text('Wishlist is empty'));
          }

          // GRID VIEW
          return  ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: provider.wishList.length,
            itemBuilder: (context, index) {
              final item = provider.wishList[index];

              final product = ProductModel(
                id: item.product.id,
                title: item.product.title,
                currentPrice: item.product.currentPrice,
                photos: item.product.photos,
              );

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),

                  // IMAGE
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AppNetworkImage(urls: product.photos),
                    ),
                  ),

                  // TITLE + PRICE
                  title: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  subtitle: Text(
                    '${Constrain.takaSign}${product.currentPrice}',
                    style: TextStyle(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // ACTION
                  trailing: const Icon(Icons.favorite, color: Colors.red),
                ),
              );
            },
          );
        },
      ),
    );
  }
}