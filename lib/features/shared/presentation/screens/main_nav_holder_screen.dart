
import 'package:finalcrafty/app/app_colors.dart';
import 'package:finalcrafty/features/home/presentation/screens/home_screen.dart';
import 'package:finalcrafty/features/shared/presentation/providers/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name='/main-nav-holder';

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  List<Widget> _screens=[
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context,mainNavProvider,_) {
        return  Scaffold(
        body: _screens[mainNavProvider.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        onTap: mainNavProvider.changeIndex,
        currentIndex: mainNavProvider.selectedIndex,
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 3,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Card'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Wish list'),
        ]),
        );
      },

    );
  }
}
