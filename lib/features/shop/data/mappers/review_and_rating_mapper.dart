import 'package:clothing_store/features/shop/data/models/review_and_rating_model.dart';
import 'package:clothing_store/features/shop/domain/entities/review_and_rating.dart';

extension ReviewAndRatingMapper on ReviewAndRatingModel? {
  ReviewAndRating toEntity() {
    return ReviewAndRating(
      id: this?.id ?? '',
      rating: this?.rating ?? 0,
      review: this?.review ?? '',
      reviewCount: this?.reviewCount ?? 0,
      ratingCount: this?.ratingCount ?? 0,
      user: this?.user ?? '',
    );
  }
}
