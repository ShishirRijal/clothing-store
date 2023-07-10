import 'package:clothing_store/core/resources/resources.dart';
import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:clothing_store/features/cart/presentation/providers/cart.dart';
import 'package:clothing_store/features/shop/domain/entities/product.dart';
import 'package:clothing_store/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView(this.product, {super.key});
  final Product product;
  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final clothSize = ['S', 'M', 'L', 'XL', 'XXL'];
  final colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  final controller = PageController();
  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // * Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              const SizedBox(height: 20),
              //* Product Name
              Text(
                product.name,
                style: getSemiBoldTextStyle(size: 22),
              ),

              const SizedBox(height: 10),
              // Ratings and reviews
              RatingAndReview(product),
              const SizedBox(height: 20),
              // * Description
              ReadMoreText(
                product.description,
                trimLength: 160,
                trimExpandedText: ' Read less',
                trimCollapsedText: 'Read more',
                trimMode: TrimMode.Length,
                style: getRegularTextStyle(size: 18, color: ColorManager.grey),
              ),
              const SizedBox(height: 20),

              Text(
                "Select Color",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              SizedBox(
                  height: 50,
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return ColorButton(
                          color: colors[index],
                          isSelected: selectedColorIndex == index,
                          onPressed: () {
                            setState(() {
                              selectedColorIndex = index;
                            });
                          },
                        );
                      })),

              const SizedBox(height: 20),

              // * Size
              Row(
                children: [
                  Text(
                    "Select Size",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // display size pdf
                    },
                    child: Text(
                      "Size Chart",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // * Size Buttons
              SizedBox(
                  height: 50,
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: product.availableSizes.length,
                      itemBuilder: (context, index) {
                        return SizeButton(product.availableSizes[index],
                            isSelected: index == selectedSizeIndex,
                            onPressed: () {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        });
                      })),

              const SizedBox(height: 30),
              AddToCart(widget.product),
            ]),
          ),
        ),
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({
    required this.color,
    this.isSelected = false,
    this.onPressed,
    super.key,
  });
  final Color color;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: !isSelected
              ? null
              : const Icon(Icons.check, color: Colors.white)),
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "Rs. ${(product.price + (product.price * 0.25)).toStringAsFixed(2)}\n",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorManager.grey,
                        // fontWeight: FontWeightManager.semiBold,
                      ),
                ),
                TextSpan(
                  text: "Rs. ${product.price.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeightManager.semiBold,
                        fontSize: 22,
                      ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            title: 'Add to cart',
            width: 50,
            onPressed: () {
              context.read<Cart>().addCartItem(product);
              getSuccessFlushbar('Added to cart', context);
            },
          ),
        ),
      ],
    );
  }
}

// SizeButtons
class SizeButton extends StatelessWidget {
  const SizeButton(
    this.size, {
    this.isSelected = false,
    this.onPressed,
    super.key,
  });
  final String size;
  final bool isSelected;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(getSemiBoldTextStyle(
              color: isSelected ? ColorManager.white : ColorManager.black)),
          backgroundColor: MaterialStatePropertyAll(
              isSelected ? ColorManager.primary : ColorManager.white),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
        child: Text(
          size,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isSelected ? ColorManager.white : ColorManager.black,
              ),
        ),
      ),
    );
  }
}

class RatingAndReview extends StatelessWidget {
  const RatingAndReview(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 24),
        const SizedBox(width: 5),
        Text(
          product.reviewAndRating.rating.toStringAsFixed(1),
          style: getBoldTextStyle(size: 18),
        ),
        const SizedBox(width: 5),
        Text(
          "(${product.reviewAndRating.ratingCount})",
          style: getRegularTextStyle(size: 18, color: ColorManager.grey),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.circle, size: 7, color: ColorManager.grey),
        const SizedBox(width: 10),
        Text(
          "(${product.reviewAndRating.reviewCount} Reviews)",
          style: getRegularTextStyle(size: 18, color: ColorManager.grey),
        ),
      ],
    );
  }
}
