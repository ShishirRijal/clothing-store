// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_and_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewAndRatingModel _$ReviewAndRatingModelFromJson(
        Map<String, dynamic> json) =>
    ReviewAndRatingModel(
      id: json['id'] as String?,
      user: json['user'] as String?,
      review: json['review'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: json['reviewCount'] as int?,
      ratingCount: json['ratingCount'] as int?,
    );

Map<String, dynamic> _$ReviewAndRatingModelToJson(
        ReviewAndRatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'review': instance.review,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'ratingCount': instance.ratingCount,
    };
