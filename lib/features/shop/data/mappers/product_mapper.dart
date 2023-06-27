import 'package:clothing_store/features/shop/data/mappers/review_and_rating_mapper.dart';
import 'package:clothing_store/features/shop/domain/entities/review_and_rating.dart';

import '../../domain/entities/product.dart';
import '../models/product_model.dart';

extension ProductMapper on ProductModel? {
  Product toEntity() {
    return Product(
      id: this?.id ?? '',
      name: this?.name ?? '',
      brand: this?.brand ?? '',
      description: this?.description ?? '',
      image: this?.image ?? [],
      price: this?.price ?? 0,
      reviewAndRating:
          this?.reviewAndRating?.toEntity() ?? ReviewAndRating.empty(),
      category: this?.category ?? '',
      availableSizes: this?.availableSizes ?? [],
      availableColors: this?.availableColors ?? [],
    );
  }
}
