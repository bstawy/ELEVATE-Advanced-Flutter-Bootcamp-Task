import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_products_use_case.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  List<ProductEntity> products = [];

  @factoryMethod
  ProductsCubit(this._getProductsUseCase) : super(ProductsInitialState());

  void getProducts() async {
    emit(ProductsLoadingState());

    final result = await _getProductsUseCase.execute();

    result.fold((error) => emit(ProductsErrorState(error)), (products) {
      this.products = products;

      emit(ProductsLoadedState(products));
    });
  }

  void search(String query) async {
    emit(ProductsLoadingState());

    List<ProductEntity> searchResults = products
        .where((product) =>
            product.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();

    emit(ProductsLoadedState(searchResults));
  }

  void clearSearch() {
    emit(ProductsLoadingState());

    emit(ProductsLoadedState(products));
  }
}
