import 'package:clothing_store/core/di.dart';
import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:clothing_store/features/shop/domain/entities/product.dart';
import 'package:clothing_store/features/shop/domain/entities/review_and_rating.dart';
import 'package:clothing_store/utils/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../authentication/data/failure/failure.dart';

class AddProductViewModel extends ChangeNotifier {
  // * text controller
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productQuantityController = TextEditingController();
  final productBrandController = TextEditingController();

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
  final _sizes = ['S', 'M', 'L', 'XL', 'XXL'];
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
  XFile? image;
  bool isLoading = false;

  // * methods
  bool isSelectedColor(Color color) => selectedColors.contains(color);
  bool isSelectedSize(String size) => selectedSizes.contains(size);
  // toggle selected color
  void toggleSelectedColor(Color color) {
    if (selectedColors.contains(color)) {
      selectedColors.remove(color);
    } else {
      selectedColors.add(color);
    }
    notifyListeners();
  }

  // toggle selected size
  void toggleSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
    notifyListeners();
  }

  // toggle selected category
  void toggleSelectedCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    notifyListeners();
  }

  //* dispose controllers
  void disposeControllers() {
    productNameController.dispose();
    productPriceController.dispose();
    productDescriptionController.dispose();
    productQuantityController.dispose();
    productBrandController.dispose();
  }

  // * select image
  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  //* add product
  Future<Either<Failure, void>> addProduct(BuildContext context) {
    // * validate the inputs
    String? errorMessage;
    if (image == null) {
      errorMessage = 'Please select an image';
    } else if (productNameController.text.isEmpty) {
      errorMessage = 'Please enter product name';
    } else if (productPriceController.text.isEmpty ||
        double.tryParse(productPriceController.text) == null) {
      errorMessage = 'Please enter a valid product price';
    } else if (productDescriptionController.text.isEmpty ||
        productDescriptionController.text.length < 5) {
      errorMessage = 'Please enter detailed product description';
    } else if (productQuantityController.text.isEmpty ||
        int.tryParse(productQuantityController.text) == null) {
      errorMessage = 'Please enter product quantity';
    } else if (productBrandController.text.isEmpty) {
      errorMessage = 'Please enter product brand';
    } else if (selectedCategories.isEmpty) {
      errorMessage = 'Please select at least one category';
    } else if (selectedColors.isEmpty) {
      errorMessage = 'Please select at least one color';
    } else if (selectedSizes.isEmpty) {
      errorMessage = 'Please select at least one size';
    }

    if (errorMessage != null) {
      // show error message as snackbar
      final snackbar = getErrorSnackbar(errorMessage, context);
      //clear the previous snackbar
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      // ignore this failure for popup
      return Future.value(
          const Left(Failure(1000, 'Product details not added properly.')));
    } else {
      final product = Product(
        id: 'id',
        name: productNameController.text,
        price: double.tryParse(productPriceController.text) ?? 0,
        description: productDescriptionController.text,
        quantity: int.tryParse(productQuantityController.text) ?? 0,
        brand: productBrandController.text,
        availableColors:
            selectedColors.map((color) => color.value.toString()).toList(),
        availableSizes: selectedSizes,
        categories: selectedCategories,
        image: image!.path,
        averageRating: 0,
        ratingCount: 0,
        reviewCount: 0,
        reviewsAndRatings: [],
      );
      final addProductUseCase = getIt<AddProductUseCase>();
      return addProductUseCase(
          AddProductParams(product: product, image: image!));
    }
  }

  // * Clear fields
  void clearFields() {
    productNameController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
    productQuantityController.clear();
    productBrandController.clear();
    selectedCategories.clear();
    selectedColors.clear();
    selectedSizes.clear();
    image = null;
    notifyListeners();
  }

  // * Getters
  List<Color> get colors => _colors;
  List<String> get sizes => _sizes;
  List<String> get categories => _categories;
}
