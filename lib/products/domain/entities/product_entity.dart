import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final num? id;
  final String? title;
  final String? description;
  final String? category;
  final num? price;
  final num? discountPercentage;
  final num? rating;
  final String? brand;
  final List<dynamic>? images;
  final String? thumbnail;
  final bool isFavorite;

  const ProductEntity({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.brand,
    this.images,
    this.thumbnail,
    this.isFavorite = false,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      brand: json['brand'],
      images: (json['images'] as List),
      thumbnail: json['thumbnail'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        price,
        discountPercentage,
        rating,
        brand,
        images,
        thumbnail,
        isFavorite,
      ];
}
