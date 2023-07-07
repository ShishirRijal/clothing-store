import 'package:clothing_store/core/resources/resources.dart';
import 'package:clothing_store/features/admin_panel/presentation/main/add_product_view.dart';
import 'package:clothing_store/features/admin_panel/presentation/main/admin_home_view.dart';
import 'package:clothing_store/features/admin_panel/presentation/main/admin_profile_view.dart';

import 'package:flutter/material.dart';

class AdminMainView extends StatefulWidget {
  const AdminMainView({this.index = 0, super.key});
  final int index;
  @override
  State<AdminMainView> createState() => _AdminMainViewState();
}

class _AdminMainViewState extends State<AdminMainView> {
  late int _selectedIndex;
  final List<Widget> _pages = const [
    AdminHomeView(),
    AddProductView(),
    AdminProfileView(),
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
          child: _pages[_selectedIndex],
        ),
      ),

      // * Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.lightGrey,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 28),
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
