import 'package:clothing_store/core/di.dart';
import 'package:clothing_store/core/resources/asset_manager.dart';
import 'package:clothing_store/core/resources/resources.dart';
import 'package:clothing_store/features/authentication/data/network/network_info.dart';
import 'package:clothing_store/features/cart/presentation/cart/cart_viewmodel.dart';
import 'package:clothing_store/features/checkout/presentation/checkout/checkout_viewmodel.dart';
import 'package:clothing_store/features/shop/shop.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../cart/cart.dart';
import 'package:flutter/material.dart';

import 'home/home_viewmodel.dart';

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
    CartView(),
    OrdersView(),
    ProfileView(),
  ];
  late Future<bool> isConnected;
  @override
  void initState() {
    super.initState();
    isConnected = getIt<NetworkInfo>().isConnected;
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<HomeViewModel>(
                create: (_) => HomeViewModel()),
            ChangeNotifierProvider<CartViewModel>(
                create: (_) => CartViewModel()),
            ChangeNotifierProvider<CheckoutViewModel>(
                create: (_) => CheckoutViewModel()),
          ],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
                future: isConnected,
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: ColorManager.primary,
                          strokeWidth: 3,
                        ))
                      : snapshot.data == false
                          ? Center(
                              child:
                                  LottieBuilder.asset(AssetManager.noInternet),
                            )
                          : pages[_selectedIndex];
                }),
          ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store_outlined),
                label: "Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
