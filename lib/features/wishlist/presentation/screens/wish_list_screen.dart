import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/center_circular_progress.dart';
import '../../../shared/widgets/product_card.dart';
import '../../provider/wish_list_provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListProvider _wishListProvider = WishListProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _wishListProvider.getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _wishListProvider,
      child: Scaffold(
        appBar: AppBar(title: const Text('Wish List')),
        body: Consumer<WishListProvider>(
          builder: (context, provider, _) {
            if (provider.getWishListInProgress) {
              return const CenterCircularProgress();
            }

            return GridView.builder(
              itemCount: provider.wishList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final item = provider.wishList[index];

                return FittedBox(
                  child: ProductCard(
                    productModel: item.product, // ✅ IMPORTANT
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}