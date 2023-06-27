import 'package:clothing_store/features/shop/data/models/review_and_rating_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String? name;
  String? brand;
  String? description;
  List<String>? image;
  double? price;
  ReviewAndRatingModel? reviewAndRating;
  String? category;
  List<String>? availableSizes;
  List<String>? availableColors; // hexvalue

  // constructor
  ProductModel({
    this.id,
    this.name,
    this.brand,
    this.description,
    this.image,
    this.price,
    this.reviewAndRating,
    this.category,
    this.availableColors,
    this.availableSizes,
  });

  // from json
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
