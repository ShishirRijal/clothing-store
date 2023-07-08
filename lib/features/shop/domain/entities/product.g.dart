// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(),
      reviewAndRating: ReviewAndRating.fromJson(
          json['reviewAndRating'] as Map<String, dynamic>),
      category: json['category'] as String,
      availableColors: (json['availableColors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      availableSizes: (json['availableSizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'reviewAndRating': instance.reviewAndRating,
      'category': instance.category,
      'availableSizes': instance.availableSizes,
      'availableColors': instance.availableColors,
    };
