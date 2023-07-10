// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_and_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewAndRatingModel _$ReviewAndRatingModelFromJson(
        Map<String, dynamic> json) =>
    ReviewAndRatingModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      review: json['review'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ReviewAndRatingModelToJson(
        ReviewAndRatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'review': instance.review,
      'rating': instance.rating,
    };
