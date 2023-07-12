import 'package:clothing_store/core/extensions.dart';
import 'package:clothing_store/features/cart/domain/usecases/add_cart_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/di.dart';
import '../../../authentication/data/failure/failure.dart';
import '../../../shop/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  final double _deliveryCharge = 150;
  int _totalItems = 0;
  double _totalPrice = 0;
  final double _discount = 50;

  // * getter
  List<CartItem> get cartItems => _cartItems;
  double get deliveryCharge => _deliveryCharge;
  int get totalItems => _totalItems;
  double get productPrice => _totalPrice;
  double get totalPrice => _totalPrice + _deliveryCharge - _discount;
  double get discount => _discount;

  //* setter
  set subTotal(double value) {
    _totalPrice = value;
    notifyListeners();
  }

  Future<Either<Failure, void>> addCartItem(Product product, String size) {
    final usecase = getIt<AddCartItemUseCase>();
    // check if the item is not in cart yet, add it
    if (_cartItems.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      final cartItem = CartItem(
        id: DateTime.now().toString(),
        product: product,
        quantity: 1,
        totalPrice: product.price,
        sizes: [size],
      );
      _cartItems.add(cartItem);
    } else {
      // if the item is already in cart, increase the quantity
      final index =
          _cartItems.indexWhere((element) => element.product.id == product.id);
      _cartItems[index].quantity++;
      _cartItems[index].totalPrice += product.price;
    }
    // also update the price and quantity of cart
    _totalPrice += product.price;
    _totalItems++;
    return usecase(
        cartItems.firstWhere((element) => element.product.id == product.id));
  }

  void removeCartItem(Product product) {
    // if item is already in cart,
    // if quantity is 1, remove it from cart
    // else decrease the quantity
    if (_cartItems.indexWhere((element) => element.product.id == product.id) !=
        -1) {
      final index =
          _cartItems.indexWhere((element) => element.product.id == product.id);
      if (_cartItems[index].quantity == 1) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity--;
      }
      _cartItems[index].totalPrice -= product.price;
    }
  }

  void clearCart() {
    _cartItems.clear();
    _totalPrice = 0;
    _totalItems = 0;
    notifyListeners();
  }
}
