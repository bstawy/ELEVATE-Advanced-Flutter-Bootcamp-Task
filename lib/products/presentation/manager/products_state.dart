part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> products;

  ProductsLoadedState(this.products);
}

final class ProductsErrorState extends ProductsState {
  final String message;

  ProductsErrorState(this.message);
}
