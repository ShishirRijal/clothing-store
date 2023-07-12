import 'dart:ffi';

import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/core/di.dart';
import 'package:clothing_store/core/resources/resources.dart';
import 'package:clothing_store/features/shop/domain/usecases/get_all_products.dart';
import 'package:clothing_store/features/shop/presentation/product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = InfiniteScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          // * Search Bar
          const SearchBar(),
          const SizedBox(height: 30),
          // * Carousel Slider for Offers
          Offers(controller: controller, images: viewModel.images),
          const SizedBox(height: 30),
          //* Trending Products
          _Header(title: "Trending", onTap: () {}),
          const SizedBox(height: 20),

          const SizedBox(height: 250, child: TrendingProducts()),
          const SizedBox(height: 30),

          //* Categories
          _Header(title: 'Categories', onTap: () {}),
          const SizedBox(height: 20),
          // * Categories List
          _categoriesChips(),
          const SizedBox(height: 20),
          const Products(),
        ],
      ),
    );
  }

  SizedBox _categoriesChips() {
    final viewModel = context.watch<HomeViewModel>();
    return SizedBox(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (context, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return CustomCategoryChip(
            viewModel.categories[index],
            isSelected: viewModel.selectedCategoryIndex == index,
            onTap: () {
              setState(() {
                viewModel.updateSelectedCategory(index);
              });
            },
          );
        },
        itemCount: viewModel.categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: getSemiBoldTextStyle()),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "View All",
            style: getRegularTextStyle()
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}

// class HeavyDiscountedProducts extends StatelessWidget {
//   const HeavyDiscountedProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       separatorBuilder: (context, _) => const SizedBox(width: 20),
//       itemBuilder: (context, index) => GestureDetector(
//         onTap: () {
//           // to to product detail screen
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ProductDetailView(product)));
//         },
//         child: Container(
//           // height: 150,
//           width: 200,
//           alignment: Alignment.bottomCenter,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//             // decoration image
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               colorFilter: ColorFilter.mode(
//                   ColorManager.black.withOpacity(0.3), BlendMode.darken),
//               image: const NetworkImage(
//                   'https://shaposh.pk/34438-large_default/formal-2187-af-nt.jpg'),
//             ),
//           ),
//           child: Container(
//             // height: 50,

//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             decoration: const BoxDecoration(
//               color: ColorManager.primary,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(15),
//                 bottomRight: Radius.circular(15),
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   "Blue Kurthi",
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: getSemiBoldTextStyle(
//                     size: 18,
//                     color: ColorManager.white,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 const PriceText(
//                   2598.99,
//                   priceWithoutDiscount: 3200.99,
//                   color: ColorManager.white,
//                 ),
//                 // const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//       itemCount: 10,
//       shrinkWrap: true,
//     );
//   }
// }

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<HomeViewModel>().getAllProducts(const NoParams()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
                strokeWidth: 3,
              ),
            );
          }
          final result = snapshot.data;

          if (result == null) {
            return const Center(child: Text("No Products Found"));
          }

          // so there is something
          return result.fold(
            (error) => Center(child: Text(error.message)),
            (products) => products.isEmpty
                ? const Center(child: Text("No Products Found"))
                : Align(
                    alignment: Alignment.centerLeft,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) =>
                          const SizedBox(width: 20),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            // to to product detail screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailView(product)));
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            // height: 150,
                            width: 200,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              // decoration image
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    ColorManager.black.withOpacity(0.3),
                                    BlendMode.darken),
                                image: NetworkImage(products[index].image),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: const BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                products[index].name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getSemiBoldTextStyle(
                                  size: 18,
                                  color: ColorManager.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: products.length,
                      shrinkWrap: true,
                    ),
                  ),
          );

          // return const Center(child: Text("No Products Found"));
        });
  }
}

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return FutureBuilder(
        future: context.read<HomeViewModel>().getAllProducts(const NoParams()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
                strokeWidth: 3,
              ),
            );
          }
          final result = snapshot.data;

          if (result == null) {
            return const Center(child: Text("No Products Found"));
          }

          // so there is something
          return result.fold((error) => Center(child: Text(error.message)),
              (products) {
            viewModel.categories[viewModel.selectedCategoryIndex] == 'All'
                ? null
                : products = products
                    .where((product) => product.categories.contains(
                        viewModel.categories[viewModel.selectedCategoryIndex]))
                    .toList();
            return products.isEmpty
                ? const Center(child: Text("No Products Found"))
                : Align(
                    alignment: Alignment.centerLeft,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Container(
                          // shadow
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // to to product detail screen
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailView(product)));
                                  },
                                  // child: SizedBox(height: 10),
                                  child: SizedBox(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: getSemiBoldTextStyle(size: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: PriceText(product.price,
                                    priceWithoutDiscount: product.price * 1.12),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: products.length,
                    ),
                  );
          });
        });
  }
}

class PriceText extends StatelessWidget {
  const PriceText(
    this.price, {
    this.priceWithoutDiscount,
    this.color = ColorManager.error,
    super.key,
  });
  final double price;
  final double? priceWithoutDiscount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Rs. ${priceWithoutDiscount?.toStringAsFixed(2)}",
              style: getRegularTextStyle().copyWith(
                color: color,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            TextSpan(
              text: "  Rs. ${price.toStringAsFixed(2)}",
              style: getRegularTextStyle().copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCategoryChip extends StatelessWidget {
  const CustomCategoryChip(
    this.title, {
    this.isSelected = false,
    this.onTap,
    super.key,
  });
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: !isSelected
              ? const BorderSide(color: ColorManager.grey)
              : BorderSide.none,
        ),
        label: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 20,
                color: isSelected ? ColorManager.white : ColorManager.grey,
              ),
        ),
        backgroundColor: isSelected ? ColorManager.primary : ColorManager.white,
      ),
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
