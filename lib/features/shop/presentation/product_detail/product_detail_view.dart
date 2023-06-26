import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final images = [
    'https://shaposh.pk/34438-large_default/formal-2187-af-nt.jpg',
    'https://i.pinimg.com/736x/94/68/d7/9468d7bc427062875b080ccadb79aff1.jpg',
    'https://www.kessa.com/wp-content/uploads/2020/08/kessa-ws564-floral-labyrinth-short-kurti-closeup-hd.jpg',
  ];
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
  }

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
            HeroImage(images: images, controller: controller),
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

class HeroImage extends StatelessWidget {
  const HeroImage({required this.images, required this.controller, super.key});
  final List<String> images;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: PageView.builder(
            itemCount: images.length,
            controller: controller,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  images[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: images.length,
            // forcing the indicator to use a specific direction
            textDirection: TextDirection.ltr,
            effect: const ExpandingDotsEffect(
              expansionFactor: 2,
              dotHeight: 15,
            ),
          ),
        ),
      ],
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
