class ProductEntity {
  late final int id;
  late final String title;
  late final String description;
  late final String category;
  late final double price;
  late final double discountPercentage;
  late final double rating;
  late final int stock;
  late final List<String> tags;
  late final String brand;
  late final String sku;
  late final int weight;
  late final Dimensions dimensions;
  late final String warrantyInformation;
  late final String shippingInformation;
  late final String availabilityStatus;
  late final List<Reviews> reviews;
  late final String returnPolicy;
  late final int minimumOrderQuantity;
  late final Meta meta;
  late final List<String> images;
  late final String thumbnail;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
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
      stock: json['stock'],
      tags: List.castFrom<dynamic, String>(json['tags']),
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: Dimensions.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews:
          List.from(json['reviews']).map((e) => Reviews.fromJson(e)).toList(),
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: Meta.fromJson(json['meta']),
      images: List.castFrom<dynamic, String>(json['images']),
      thumbnail: json['thumbnail'],
    );
  }
}

class Dimensions {
  late final double width;
  late final double height;
  late final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'],
      height: json['height'],
      depth: json['depth'],
    );
  }
}

class Reviews {
  late final int rating;
  late final String comment;
  late final String date;
  late final String reviewerName;
  late final String reviewerEmail;

  Reviews({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Meta {
  late final String barcode;
  late final String qrCode;

  Meta({
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
