import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final num? id;
  final String? title;
  final String? description;
  final String? category;
  final num? price;
  final RatingEntity? rating;
  final String? image;
  final bool isFavorite;

  const ProductEntity({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.image,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        price,
        rating,
        isFavorite,
      ];
}

class RatingEntity {
  final num? rate;
  final num? count;

  const RatingEntity({
    this.rate,
    this.count,
  });
}
