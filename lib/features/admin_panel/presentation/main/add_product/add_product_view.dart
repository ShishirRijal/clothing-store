import 'dart:io';

import 'package:clothing_store/core/resources/resources.dart';
import 'package:clothing_store/features/authentication/presentation/forgot_password/forgot_password_view.dart';
import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shop/shop.dart';
import 'add_product_viewmodel.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  @override
  void dispose() {
    // context.read<AddProductViewModel>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddProductViewModel>();
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
                  child: GestureDetector(
                    onTap: () {
                      viewModel.selectImage();
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      // padding: const EdgeInsets.all(10),
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
                      child: viewModel.image == null
                          ? Center(
                              child: IconButton(
                                icon: const Icon(Icons.add_a_photo),
                                onPressed: () {},
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(viewModel.image!.path),
                                fit: BoxFit.fill,
                              ),
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
                  controller: viewModel.productNameController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                //* Product Brand
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Brand Name',
                  controller: viewModel.productBrandController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // * Product Price
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  controller: viewModel.productPriceController,
                  hintText: 'Product Price',
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),

                // * Product Quantity
                CustomTextField(
                  errorText: null,
                  onChange: (_) {},
                  hintText: 'Product Quantity',
                  controller: viewModel.productQuantityController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // // * Select available product colors
                // Text(
                //   'Available colors',
                //   style: getSemiBoldTextStyle(),
                // ),
                // const SizedBox(height: 10),
                // SizedBox(
                //     height: 50,
                //     child: ListView.separated(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: viewModel.colors.length,
                //         separatorBuilder: (context, index) => const SizedBox(
                //               width: 20,
                //             ),
                //         itemBuilder: (context, index) {
                //           return _ColorBox(
                //             viewModel.colors[index].value,
                //             isSelected: viewModel.selectedColors
                //                 .contains(viewModel.colors[index].value),
                //             onPressed: () => viewModel.toggleSelectedColor(
                //                 viewModel.colors[index].value),
                //           );
                //         })),

                // const SizedBox(height: 20),

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
                        itemCount: viewModel.sizes.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 20,
                            ),
                        itemBuilder: (context, index) {
                          return SizeButton(
                            viewModel.sizes[index],
                            isSelected: viewModel
                                .isSelectedSize(viewModel.sizes[index]),
                            onPressed: () => viewModel
                                .toggleSelectedSize(viewModel.sizes[index]),
                          );
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
                    for (var category in viewModel.categories)
                      CategoryButton(category,
                          isSelected:
                              viewModel.selectedCategories.contains(category),
                          onPressed: () =>
                              viewModel.toggleSelectedCategory(category)),
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
                  controller: viewModel.productDescriptionController,
                ),

                // * Add Product Button
                const SizedBox(height: 40),

                CustomButton(
                  title: 'Add Product',
                  onPressed: () async {
                    // * validate the inputs
                    showDialog(
                        context: context,
                        builder: (context) => const LoadingPopup());
                    (await viewModel.addProduct(context)).fold((l) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      if (l.code != 1000) {
                        showDialog(
                            context: context,
                            builder: (context) => ErrorPopup(
                                  errorText: l.message,
                                ));
                      }
                    }, (r) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessPopup(
                              message: 'Product added successfully',
                              onPressed: () {
                                viewModel.clearFields();
                                Navigator.pop(context);
                              },
                            );
                          });
                    });
                  },
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
                  .bodyLarge!
                  .copyWith(color: ColorManager.white)
              : Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

// class _ColorBox extends StatelessWidget {
//   const _ColorBox(
//     this.colorValue, {
//     this.isSelected = false,
//     this.onPressed,
//   });
//   final int colorValue;

//   final bool isSelected;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 50,
//         width: 50,

//         decoration: BoxDecoration(
//           color: Color(colorValue),
//           borderRadius: BorderRadius.circular(100),
//           //shadow
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         // show tick sign if selected
//         child: isSelected
//             ? Icon(
//                 Icons.check,
//                 color: colorValue == Colors.white.value
//                     ? ColorManager.primary
//                     : ColorManager.white,
//               )
//             : const SizedBox.shrink(),
//       ),
//     );
//   }
// }
