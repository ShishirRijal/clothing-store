import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Orders", style: getSemiBoldTextStyle()),
    );
  }
}
