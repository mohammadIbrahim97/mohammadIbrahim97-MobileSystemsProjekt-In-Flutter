
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/presentation/views/cart_view.dart';
import 'package:flutter_application_1/features/home/presentation/views/home_view.dart';
import 'package:flutter_application_1/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_application_1/features/search/presentation/views/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
PersistentTabController _controller = PersistentTabController();


class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context, 
      screens: _buildScreens() ,
      items: _navBarsItems(),
      controller: _controller,
      );
  }
}

List<Widget> _buildScreens() {
    return [
          const HomeView(),
          const CartView(),
          const SearchView(),
          const ProfileView(),
          ];
}

List<PersistentBottomNavBarItem> _navBarsItems(){
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      ),
      PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_bag),
      ),
      PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      ),
      PersistentBottomNavBarItem(
      icon: const Icon(Icons.email),
      ),
  ];
}