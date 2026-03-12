
import 'package:finalcrafty/app/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/appBarIconButton.dart';

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
    );
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

