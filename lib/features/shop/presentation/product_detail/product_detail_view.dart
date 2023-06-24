import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorManager.black),
            onPressed: () => Navigator.pop(context)),
        title: Text('Product Detail', style: getSemiBoldTextStyle()),
        actions: [
          IconButton(
              icon:
                  const Icon(Icons.favorite_border, color: ColorManager.black),
              onPressed: () {
                //
              }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://shaposh.pk/34438-large_default/formal-2187-af-nt.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
