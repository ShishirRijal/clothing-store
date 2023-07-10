import 'package:json_annotation/json_annotation.dart';

part 'review_and_rating.g.dart';

@JsonSerializable()
class ReviewAndRating {
  String id;
  String userId;
  String review;
  double rating;

  ReviewAndRating({
    required this.id,
    required this.userId,
    required this.review,
    required this.rating,
  });

  // initialize empty
  ReviewAndRating.empty({
    this.id = '',
    this.userId = '',
    this.review = '',
    this.rating = 0,
  });

  // to json method
  Map<String, dynamic> toJson() => _$ReviewAndRatingToJson(this);
  // from json
  factory ReviewAndRating.fromJson(Map<String, dynamic> json) =>
      _$ReviewAndRatingFromJson(json);
}
