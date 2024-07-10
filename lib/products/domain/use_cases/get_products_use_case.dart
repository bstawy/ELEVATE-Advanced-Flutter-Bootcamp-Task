import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';
import '../repository/products_repository.dart';

@injectable
class GetProductsUseCase {
  final ProductsRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<Either<String, List<ProductEntity>>> execute() {
    return _productRepository.getProducts();
  }
}
