import 'package:clothing_store/features/shop/data/models/review_and_rating_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String? name;
  String? brand;
  String? description;
  String? image;
  double? price;
  ReviewAndRatingModel? reviewAndRating;
  List<String>? categories;
  List<String>? availableSizes;
  List<String>? availableColors; // hexvalue
  int? quantity;

  // constructor
  ProductModel({
    this.id,
    this.name,
    this.brand,
    this.description,
    this.image,
    this.price,
    this.reviewAndRating,
    this.categories,
    this.availableColors,
    this.availableSizes,
    this.quantity,
  });

  // from json
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
