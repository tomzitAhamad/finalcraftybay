
import 'package:finalcrafty/app/asset_paths.dart';
import 'package:finalcrafty/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/widgets/category_card.dart';
import '../widgets/appBarIconButton.dart';
import '../widgets/home_category_list.dart';
import '../widgets/product_search_bar.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(

          children: [
            SizedBox(height: 8,),
            ProductSearchBar(),
            SizedBox(height: 16,),
            HomeSlider(),
            SizedBox(height: 16,),
            SectionHeader(name: 'Categories', onTapSeeAll: () {  },),
            _buildCategoryList()
          ],
        ),
      ),
    );


  }

  Widget _buildCategoryList(){
    return HomeCategoryList();
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: SvgPicture.asset(

          AssetPaths.navLogoSvg),
      actions: [
        AppBarIconButton(icon: Icons.person, onTap: () {  },),
        SizedBox(width: 8,),
        AppBarIconButton(icon: Icons.call, onTap: () {  },),
        SizedBox(width: 8,),
        AppBarIconButton(icon: Icons.notifications_active_outlined, onTap: () {  },)
      ],
    );
  }
}









