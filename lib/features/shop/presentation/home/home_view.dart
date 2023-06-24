import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = InfiniteScrollController();
  final _images = [
    'https://centralmallonline.in/wp-content/uploads/2022/12/banner3-scaled.jpg',
    'https://cdn.flipshope.com/blog/wp-content/uploads/2021/10/Meesho-sale.png',
    'https://www.informalnewz.com/wp-content/uploads/2022/11/Meesho-launches.jpg',
    'https://www.voiceofentrepreneur.com/wp-content/uploads/2021/10/244399434_1578769505814795_237892040837641265_n.png',
  ];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // * Search Bar
            const SearchBar(),
            const SizedBox(height: 20),
            // * Carousel Slider for Offers
            Offers(controller: controller, images: _images)
          ],
        ),
      )),
    );
  }
}

class Offers extends StatelessWidget {
  const Offers({
    super.key,
    required this.controller,
    required List<String> images,
  }) : _images = images;

  final InfiniteScrollController controller;
  final List<String> _images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: InfiniteCarousel.builder(
        itemCount: 5,
        itemExtent: MediaQuery.of(context).size.width * 0.75,
        center: true,
        onIndexChanged: (index) {},
        controller: controller,
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(_images[itemIndex % 4]),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, size: 28),
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
      ),
    );
  }
}
