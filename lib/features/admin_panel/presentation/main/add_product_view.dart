import 'package:clothing_store/core/resources/resources.dart';
import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

import '../../../shop/shop.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
    Colors.red,
    Colors.blue,
  ];
  final _size = ['S', 'M', 'L', 'XL', 'XXL'];
  final _categories = [
    'T-Shirt',
    'Shirt',
    'Pants',
    'Shoes',
    'Socks',
    'Jacket',
    'Coat',
    'Sweater',
    'Hoodie',
    'Hat',
    'Men',
    'Women',
    'Kids',
    'Accessories',
    'Bags',
    'Wallets',
    'Watches',
    'Jewelry',
    'Sunglasses',
    'Belts',
  ];
  List<String> selectedSizes = [];
  List<Color> selectedColors = [];
  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Add New Product',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // * Product Image
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 13,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // * Product Name
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Product Name',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                //* Product Brand
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Brand Name',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // * Product Price
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Product Price',
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),

                // * Product Quantity
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Product Quantity',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // * Select available product colors
                Text(
                  'Available colors',
                  style: getSemiBoldTextStyle(),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _colors.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 20,
                            ),
                        itemBuilder: (context, index) {
                          return _ColorBox(
                            _colors[index],
                            isSelected: selectedColors.contains(_colors[index]),
                            onPressed: () {
                              if (selectedColors.contains(_colors[index])) {
                                selectedColors.remove(_colors[index]);
                              } else {
                                selectedColors.add(_colors[index]);
                              }
                              setState(() {});
                            },
                          );
                        })),

                const SizedBox(height: 20),

                // * Select available sizes
                Text(
                  'Available sizes',
                  style: getSemiBoldTextStyle(),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _size.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 20,
                            ),
                        itemBuilder: (context, index) {
                          return SizeButton(_size[index],
                              isSelected: selectedSizes.contains(_size[index]),
                              onPressed: () {
                            if (selectedSizes.contains(_size[index])) {
                              selectedSizes.remove(_size[index]);
                            } else {
                              selectedSizes.add(_size[index]);
                            }
                            setState(() {});
                          });
                          ;
                        })),

                const SizedBox(height: 20),

                // * Product Category checkbox to select multiple categories
                Text(
                  'Select Product Category',
                  style: getSemiBoldTextStyle(),
                ),
                const SizedBox(height: 10),
                // * Product Category checkbox to select multiple categories
                SizedBox(
                    child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var category in _categories)
                      CategoryButton(category,
                          isSelected: selectedCategories.contains(category),
                          onPressed: () {
                        if (selectedCategories.contains(category)) {
                          selectedCategories.remove(category);
                        } else {
                          selectedCategories.add(category);
                        }
                        setState(() {});
                      }),
                  ],
                )),

                const SizedBox(height: 20),

                // * Product Description
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Product Description',
                  keyboardType: TextInputType.number,
                  minLines: 7,
                  maxLines: 10,
                ),

                // * Add Product Button
                const SizedBox(height: 40),

                CustomButton(
                  title: 'Add Product',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// CategoryButton custom widget
class CategoryButton extends StatelessWidget {
  const CategoryButton(this.title,
      {super.key, this.isSelected = false, this.onPressed});
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.primary : ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: ColorManager.white)
              : Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox(
    this.color, {
    this.isSelected = false,
    this.onPressed,
  });
  final Color color;

  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        // show tick sign if selected
        child: isSelected
            ? const Icon(Icons.check, color: ColorManager.white)
            : const SizedBox.shrink(),
      ),
    );
  }
}
