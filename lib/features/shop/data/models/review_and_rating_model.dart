import 'package:json_annotation/json_annotation.dart';
part 'review_and_rating_model.g.dart';

@JsonSerializable()
class ReviewAndRatingModel {
  String? id;
  String? userId;
  String? review;
  double? rating;

  ReviewAndRatingModel({
    this.id,
    this.userId,
    this.review,
    this.rating,
  });
  // to json
  Map<String, dynamic> toJson() => _$ReviewAndRatingModelToJson(this);
// from json
  factory ReviewAndRatingModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewAndRatingModelFromJson(json);
}
