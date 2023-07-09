import 'package:flutter/material.dart';

import '../../../shop/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  final double _deliveryCharge = 0;
  int _totalItems = 0;
  double _totalPrice = 0;
  final double _discount = 0;

  // * getter
  List<CartItem> get cartItems => _cartItems;
  double get deliveryCharge => _deliveryCharge;
  int get totalItems => _totalItems;
  double get productPrice => _totalPrice;
  double get totalPrice => _totalPrice + _deliveryCharge - _discount;
  double get discount => _discount;

  void addCartItem(Product product) {
    // check if the item is not in cart yet, add it
    if (_cartItems.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      final cartItem = CartItem(
        id: DateTime.now().toString(),
        product: product,
        quantity: 1,
        totalPrice: product.price,
        size: product.availableSizes,
        color: product.availableColors,
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
