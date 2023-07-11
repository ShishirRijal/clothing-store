import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/core/di.dart';
import 'package:clothing_store/features/shop/domain/usecases/get_all_products.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final getAllProducts = getIt<GetAllProductsUseCase>();
  final _categories = [
    'All',
    'T-Shirt',
    'Shirt',
    'Jeans',
    'Shoes',
    'T-Shirt',
    'Shirt',
    'Jeans',
    'Shoes',
  ];
  final _images = [
    'https://centralmallonline.in/wp-content/uploads/2022/12/banner3-scaled.jpg',
    'https://cdn.flipshope.com/blog/wp-content/uploads/2021/10/Meesho-sale.png',
    'https://www.informalnewz.com/wp-content/uploads/2022/11/Meesho-launches.jpg',
    'https://www.voiceofentrepreneur.com/wp-content/uploads/2021/10/244399434_1578769505814795_237892040837641265_n.png',
  ];
  int selectedCategoryIndex = 0;

  void updateSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  //* getters
  List<String> get categories => _categories;
  List<String> get images => _images;
}
