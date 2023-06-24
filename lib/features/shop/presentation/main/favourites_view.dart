import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Favourites", style: getSemiBoldTextStyle()),
    );
  }
}
