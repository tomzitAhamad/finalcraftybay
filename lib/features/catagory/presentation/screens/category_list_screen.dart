
import 'package:finalcrafty/features/shared/presentation/providers/main_nav_provider.dart';
import 'package:finalcrafty/features/shared/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        _onTapBackButton();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton( onPressed:_onTapBackButton, icon: Icon(Icons.arrow_back_ios),),
          title: Text('Categories'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 40,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 18,crossAxisSpacing: 18), itemBuilder: (context,index){
            return FittedBox(child: CategoryCard());
          }),
        ),
      ),
    );
  }
  void _onTapBackButton(){
    context.read<MainNavProvider>().backToHome();
  }
}

