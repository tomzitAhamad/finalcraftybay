
import 'package:finalcrafty/features/cart/presentation/widgets/totalPriceAndCheckoutSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_provider.dart';
import '../widgets/card_items.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        _onTapBackButton();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton( onPressed:_onTapBackButton, icon: Icon(Icons.arrow_back_ios),),
          title: Text('Carts'),),
        body: Column(
          children: [
            Expanded(child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index){
              return CardItems();
            })),
            TotalPriceAndCheckOutSection(totalPrice: 120, onTapCheckOutCart: (){})
          ],
        )
      ),
    );
  }
  void _onTapBackButton(){
    context.read<MainNavProvider>().backToHome();
  }
}


