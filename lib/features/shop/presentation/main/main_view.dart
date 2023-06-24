import 'package:clothing_store/core/resources/resources.dart';

import 'home/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({this.index = 0, super.key});
  final int index;
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _selectedIndex;
  List<Widget> pages = const [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: pages[_selectedIndex],
        ),
      ),

      // * Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorManager.grey,
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 28),
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
