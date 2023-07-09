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

  // empty constructor
  Product.empty()
      : this(
          id: '',
          name: '',
          brand: '',
          description: '',
          image: '',
          price: 0.0,
          reviewAndRating: ReviewAndRating.empty(),
          categories: [],
          availableColors: [],
          availableSizes: [],
          quantity: 0,
        );

  // to json method
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // from json
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

Product product = Product(
    name: 'Red overcoat for women',
    brand: 'Gucci',
    description:
        "loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum loreum ipsum ",
    image:
        "https://dqp736wsu6w3m.cloudfront.net/s3bucket/og/feed/img/man_coat/636781/without_model_small.png",
    price: 3456.99,
    reviewAndRating: ReviewAndRating(
      id: '948jd',
      rating: 4.5,
      ratingCount: 34,
      review: 'sdhfisdhis',
      reviewCount: 34,
      user: 'Shishir Rijal',
    ),
    categories: ['coat', 'female'],
    availableColors: ['red'],
    availableSizes: ['XL', 'XXL', 'XXl'],
    quantity: 23);
