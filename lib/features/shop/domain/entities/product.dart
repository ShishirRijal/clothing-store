import 'package:json_annotation/json_annotation.dart';

import 'review_and_rating.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  String id;
  String name;
  String brand;
  String description;
  String image;
  double price;
  ReviewAndRating reviewAndRating;
  List<String> categories;
  List<String> availableSizes;
  List<String> availableColors; // hexvalue
  int quantity;
  Product({
    this.id = '',
    required this.name,
    required this.brand,
    required this.description,
    required this.image,
    required this.price,
    required this.reviewAndRating,
    required this.categories,
    required this.availableColors,
    required this.availableSizes,
    required this.quantity,
  });

  // to json method
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // from json
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
