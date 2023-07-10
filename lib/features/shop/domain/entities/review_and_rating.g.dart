// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_and_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewAndRating _$ReviewAndRatingFromJson(Map<String, dynamic> json) =>
    ReviewAndRating(
      id: json['id'] as String,
      userId: json['userId'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ReviewAndRatingToJson(ReviewAndRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'review': instance.review,
      'rating': instance.rating,
    };
