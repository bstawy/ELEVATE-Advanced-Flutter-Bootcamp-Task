import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/networking/api_constants.dart';
import '../../../core/networking/dio_factory.dart';
import 'products_data_source.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  late Dio _dio;

  ProductsDataSourceImpl() {
    _dio = DioFactory.getDio();
  }

  @override
  Future<Response> getProducts() async {
    return await _dio.get(ApiConstants.productsEndPoint);
  }
}
