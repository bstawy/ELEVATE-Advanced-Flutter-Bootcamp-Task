import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/networking/api_constants.dart';
import 'products_data_source.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  final Dio _dio;

  @factoryMethod
  ProductsDataSourceImpl(this._dio);

  @override
  Future<Response> getProducts() async {
    return await _dio.get(ApiConstants.productsEndPoint);
  }
}
