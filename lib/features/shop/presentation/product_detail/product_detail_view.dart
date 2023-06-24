import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // * Product Image
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
            ),
            const SizedBox(height: 20),
            //* Product Name
            Text(
              "Traditional Blue Kurthi",
              style: getSemiBoldTextStyle(size: 22),
            ),
            const SizedBox(height: 10),
            // Ratings and reviews
            const RatingAndReview(),
            const SizedBox(height: 20),
            // * Description
            ReadMoreText(
              "This is a traditional blue kurthi with a beautiful design. It is made of cotton and is very comfortable to wear. It is available in all sizes. This is a traditional blue kurthi with a beautiful design. It is made of cotton and is very comfortable to wear. It is available in all sizes. This is a traditional blue kurthi with a beautiful design. It is made of cotton and is very comfortable to wear. It is available in all sizes and colors.",
              trimLength: 160,
              trimExpandedText: ' Read less',
              trimCollapsedText: 'Read more',
              trimMode: TrimMode.Length,
              style: getRegularTextStyle(size: 18, color: ColorManager.grey),
            ),
          ]),
        ),
      ),
    );
  }
}

class RatingAndReview extends StatelessWidget {
  const RatingAndReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 24),
        const SizedBox(width: 5),
        Text(
          "4.8",
          style: getBoldTextStyle(size: 18),
        ),
        const SizedBox(width: 5),
        Text(
          "(335)",
          style: getRegularTextStyle(size: 18, color: ColorManager.grey),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.circle, size: 7, color: ColorManager.grey),
        const SizedBox(width: 10),
        Text(
          "(124 Reviews)",
          style: getRegularTextStyle(size: 18, color: ColorManager.grey),
        ),
      ],
    );
  }
}
