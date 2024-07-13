import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:route_tech_summit_flutter_task/products/domain/entities/product_entity.dart';
import 'package:route_tech_summit_flutter_task/products/domain/repository/products_repository.dart';

import '../../testing_data.dart';

@GenerateMocks([ProductsRepository])
import 'get_products_use_case_test.mocks.dart';

void main() {
  late List<ProductEntity> products;

  setUpAll(() {
    products = TestingData.products;
  });

  test('should return a list of products', () async {
    // Arrange
    final productsRepository = MockProductsRepository();

    // Act
    when(productsRepository.getProducts())
        .thenAnswer((_) async => Right(products));

    // Assert
    expect(await productsRepository.getProducts(), Right(products));
  });
}
