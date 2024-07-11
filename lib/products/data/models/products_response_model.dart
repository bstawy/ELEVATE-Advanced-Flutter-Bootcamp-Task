import 'product_model.dart';

class ProductsResponse {
  final List<ProductModel> products;
  final num total;
  final num skip;
  final num limit;

  ProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      products: (json['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
