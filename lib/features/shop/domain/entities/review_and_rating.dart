class ReviewAndRating {
  String id;
  String user;
  String review;
  double rating;
  int reviewCount;
  int ratingCount;

  ReviewAndRating({
    required this.id,
    required this.user,
    required this.review,
    required this.rating,
    required this.reviewCount,
    required this.ratingCount,
  });

  // initialize empty
  ReviewAndRating.empty({
    this.id = '',
    this.user = '',
    this.review = '',
    this.rating = 0,
    this.ratingCount = 0,
    this.reviewCount = 0,
  });
}
