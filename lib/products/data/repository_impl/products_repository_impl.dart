import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repository/products_repository.dart';
import '../data_source/products_data_source.dart';
import '../models/product_model.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource _productsDataSource;

  @factoryMethod
  ProductsRepositoryImpl(this._productsDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> getProducts() async {
    try {
      final response = await _productsDataSource.getProducts();

      if (response.statusCode == 200) {
        final List<ProductModel> products = (response.data as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();

        return Right(products);
      } else {
        return const Left('Failed to fetch products');
      }
    } on DioException catch (dioException) {
      return Left(dioException.response?.statusCode.toString() ?? "");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
