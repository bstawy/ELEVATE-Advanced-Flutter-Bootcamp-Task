// test/products_cubit_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';

import 'package:route_tech_summit_flutter_task/products/domain/entities/product_entity.dart';
import 'package:route_tech_summit_flutter_task/products/domain/use_cases/get_products_use_case.dart';
import 'package:route_tech_summit_flutter_task/products/presentation/manager/products_cubit.dart';

import '../../testing_data.dart';

@GenerateMocks([GetProductsUseCase])
import 'products_cubit_test.mocks.dart';

void main() {
  late List<ProductEntity> products;

  setUpAll(
    () {
      products = TestingData.products;
    },
  );

  group('GetProducts Tests', () {
    late MockGetProductsUseCase mockGetProductsUseCase;

    setUp(() {
      mockGetProductsUseCase = MockGetProductsUseCase();
    });

    blocTest<ProductsCubit, ProductsState>(
      '''Cubit get products function test success
emit (Products loading state)
✅Products retrieved successfully
emit (Products loaded state)''',
      build: () {
        when(mockGetProductsUseCase.execute()).thenAnswer(
          (_) async => Right(products),
        );

        return ProductsCubit(mockGetProductsUseCase);
      },
      act: (cubit) => cubit.getProducts(),
      expect: () => [
        ProductsLoadingState(),
        isA<ProductsLoadedState>().having(
          (state) => state.products,
          'products',
          hasLength(3),
        ),
      ],
      verify: (cubit) {
        verify(mockGetProductsUseCase.execute()).called(1);
      },
    );

    blocTest<ProductsCubit, ProductsState>(
      '''Cubit get products function test fail
emit (Products loading state)
❌Products retrieved unsuccessfully
emit (Products error state)''',
      build: () {
        when(mockGetProductsUseCase.execute())
            .thenAnswer((_) async => const Left('Failed to fetch products'));

        return ProductsCubit(mockGetProductsUseCase);
      },
      act: (cubit) => cubit.getProducts(),
      expect: () => [
        ProductsLoadingState(),
        ProductsErrorState('Failed to fetch products'),
      ],
      verify: (cubit) {
        verify(mockGetProductsUseCase.execute()).called(1);
      },
    );
  });

  group('Products searched by keyword tests', () {
    late MockGetProductsUseCase mockGetProductsUseCase;

    setUp(() {
      mockGetProductsUseCase = MockGetProductsUseCase();
    });
    blocTest<ProductsCubit, ProductsState>(
      '''Cubit search function test success
emit (Products loading state)
✅Searched Products retrieved successfully
emit (Products loaded state)''',
      build: () {
        when(mockGetProductsUseCase.execute()).thenAnswer(
          (_) async => Right(
            products.where((product) => product.title!.contains('c')).toList(),
          ),
        );

        final cubit = ProductsCubit(mockGetProductsUseCase);

        cubit.products = products;

        cubit.search('c');
        return cubit;
      },
      act: (cubit) => cubit.search('c'),
      expect: () => [
        ProductsLoadingState(),
        isA<ProductsLoadedState>().having(
          (state) => state.products,
          'products',
          hasLength(2),
        ),
      ],
    );
  });
}
