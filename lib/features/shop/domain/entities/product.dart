import 'package:json_annotation/json_annotation.dart';

import 'review_and_rating.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String brand;
  String description;
  List<String> image;
  double price;
  ReviewAndRating reviewAndRating;
  String category;
  List<String> availableSizes;
  List<String> availableColors; // hexvalue

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.image,
    required this.price,
    required this.reviewAndRating,
    required this.category,
    required this.availableColors,
    required this.availableSizes,
  });

  // to json method
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // from json
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
