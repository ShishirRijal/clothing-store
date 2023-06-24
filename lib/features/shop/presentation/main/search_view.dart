import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search", style: getSemiBoldTextStyle()),
    );
  }
}
