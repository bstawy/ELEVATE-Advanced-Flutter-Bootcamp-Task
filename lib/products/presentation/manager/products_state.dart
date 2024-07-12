part of 'products_cubit.dart';

@immutable
sealed class ProductsState extends Equatable {}

final class ProductsInitialState extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> products;

  ProductsLoadedState(this.products);

  @override
  List<Object?> get props => [products];
}

final class ProductsErrorState extends ProductsState {
  final String message;

  ProductsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
