import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cart", style: getSemiBoldTextStyle()),
    );
  }
}
