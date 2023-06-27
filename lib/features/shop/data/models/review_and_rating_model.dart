import 'package:json_annotation/json_annotation.dart';
part 'review_and_rating_model.g.dart';

@JsonSerializable()
class ReviewAndRatingModel {
  String? id;
  String? user;
  String? review;
  double? rating;
  int? reviewCount;
  int? ratingCount;

  ReviewAndRatingModel({
    this.id,
    this.user,
    this.review,
    this.rating,
    this.reviewCount,
    this.ratingCount,
  });
  // to json
  Map<String, dynamic> toJson() => _$ReviewAndRatingModelToJson(this);
// from json
  factory ReviewAndRatingModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewAndRatingModelFromJson(json);
}
