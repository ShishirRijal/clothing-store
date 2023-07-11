import 'package:flutter/material.dart';
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
  List<ReviewAndRating> reviewsAndRatings;
  List<String> categories;
  List<String> availableSizes;
  List<int> availableColors; // hexvalue
  int ratingCount;
  int reviewCount;
  int quantity;
  double averageRating;
  Product({
    this.id = '',
    required this.name,
    required this.brand,
    required this.description,
    required this.image,
    required this.price,
    required this.reviewsAndRatings,
    required this.categories,
    required this.availableColors,
    required this.availableSizes,
    required this.quantity,
    required this.ratingCount,
    required this.reviewCount,
    required this.averageRating,
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
          reviewsAndRatings: [],
          categories: [],
          availableColors: [],
          availableSizes: [],
          quantity: 0,
          reviewCount: 0,
          ratingCount: 0,
          averageRating: 0,
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
  reviewsAndRatings: [
    ReviewAndRating(
      id: '948jd',
      rating: 4.5,
      review: 'nice product. fully satisfied',
      userId: 'ShishirRijal',
    ),
    ReviewAndRating(
      id: '948jd',
      rating: 4.5,
      review: 'loved it :) ',
      userId: 'ShishirRijal',
    ),
  ],
  categories: ['coat', 'female'],
  availableColors: [Colors.red.value, Colors.blue.value],
  availableSizes: ['XL', 'XXL', 'XXl'],
  quantity: 23,
  ratingCount: 34,
  reviewCount: 2,
  averageRating: 4.5,
);
