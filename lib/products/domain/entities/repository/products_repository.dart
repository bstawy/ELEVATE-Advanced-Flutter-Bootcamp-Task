import 'package:dartz/dartz.dart';

import '../product_model.dart';

abstract class ProductsRepository {
  Future<Either<String, List<ProductEntity>>> getProducts();
}
