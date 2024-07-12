// test/products_cubit_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import 'package:route_tech_summit_flutter_task/core/di/di.dart';
import 'package:route_tech_summit_flutter_task/products/domain/entities/product_entity.dart';
import 'package:route_tech_summit_flutter_task/products/domain/use_cases/get_products_use_case.dart';
import 'package:route_tech_summit_flutter_task/products/presentation/manager/products_cubit.dart';

@GenerateMocks([GetProductsUseCase])
import 'products_cubit_test.mocks.dart';

void main() {
  final getIt = GetIt.instance;

  late List<ProductEntity> products;

  setUpAll(
    () {
      configureDependencies();

      products = <ProductEntity>[
        const ProductEntity(
          id: 1,
          title: 'Cupcake',
          description: 'Description 1',
          category: 'Category 1',
          price: 100,
          discountPercentage: 10,
          rating: 4.5,
          brand: 'Brand 1',
          images: ['image1.png'],
          thumbnail: 'thumbnail1.png',
        ),
        const ProductEntity(
          id: 2,
          title: 'Car',
          description: 'Description 2',
          category: 'Category 2',
          price: 200,
          discountPercentage: 20,
          rating: 4.0,
          brand: 'Brand 2',
          images: ['image2.png'],
          thumbnail: 'thumbnail2.png',
        ),
        const ProductEntity(
          id: 3,
          title: 'Phone',
          description: 'Description 3',
          category: 'Category 3',
          price: 300,
          discountPercentage: 30,
          rating: 4.0,
          brand: 'Brand 3',
          images: ['image3.png'],
          thumbnail: 'thumbnail3.png',
        ),
      ];
    },
  );

  group('ProductsCubit Tests', () {
    late MockGetProductsUseCase mockGetProductsUseCase;

    setUp(() {
      mockGetProductsUseCase = MockGetProductsUseCase();
      if (!getIt.isRegistered<GetProductsUseCase>()) {
        getIt.registerSingleton<GetProductsUseCase>(mockGetProductsUseCase);
      }
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
