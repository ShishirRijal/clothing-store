// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      reviewAndRating: (json['reviewAndRating'] as List<dynamic>?)
          ?.map((e) => ReviewAndRatingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableColors: (json['availableColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableSizes: (json['availableSizes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quantity: json['quantity'] as int?,
      ratingCount: json['ratingCount'] as int?,
      reviewCount: json['reviewCount'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'reviewAndRating': instance.reviewAndRating,
      'categories': instance.categories,
      'availableSizes': instance.availableSizes,
      'availableColors': instance.availableColors,
      'ratingCount': instance.ratingCount,
      'reviewCount': instance.reviewCount,
      'quantity': instance.quantity,
      'averageRating': instance.averageRating,
    };
