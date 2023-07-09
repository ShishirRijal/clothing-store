import '../../../shop/domain/entities/product.dart';

class CartItem {
  String id;
  Product product;
  int quantity;
  double totalPrice;
  final List<String> size;
  final List<String> color;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.size,
    required this.color,
  });
}
