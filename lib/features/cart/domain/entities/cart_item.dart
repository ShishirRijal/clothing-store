import '../../../shop/domain/entities/product.dart';

class CartItem {
  String id;
  Product product;
  int quantity;
  double totalPrice;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });
}
