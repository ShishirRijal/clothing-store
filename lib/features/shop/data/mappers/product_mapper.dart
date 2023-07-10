import 'package:clothing_store/features/shop/data/mappers/review_and_rating_mapper.dart';

import '../../domain/entities/product.dart';
import '../models/product_model.dart';

extension ProductMapper on ProductModel? {
  Product toEntity() {
    return Product(
      id: this?.id ?? '',
      name: this?.name ?? '',
      brand: this?.brand ?? '',
      description: this?.description ?? '',
      image: this?.image ?? '',
      price: this?.price ?? 0,
      quantity: this?.quantity ?? 0,
      reviewsAndRatings:
          this?.reviewAndRating?.map((e) => e.toEntity()).toList() ?? [],
      categories: this?.categories ?? [],
      availableSizes: this?.availableSizes ?? [],
      availableColors: this?.availableColors ?? [],
      reviewCount: this?.reviewCount ?? 0,
      ratingCount: this?.ratingCount ?? 0,
      averageRating: this?.averageRating ?? 0,
    );
  }
}
