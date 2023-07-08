// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_and_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewAndRating _$ReviewAndRatingFromJson(Map<String, dynamic> json) =>
    ReviewAndRating(
      id: json['id'] as String,
      user: json['user'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      ratingCount: json['ratingCount'] as int,
    );

Map<String, dynamic> _$ReviewAndRatingToJson(ReviewAndRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'review': instance.review,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'ratingCount': instance.ratingCount,
    };
