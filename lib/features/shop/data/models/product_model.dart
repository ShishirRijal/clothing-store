import 'package:clothing_store/features/shop/data/models/review_model.dart';

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
}
