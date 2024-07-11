// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../products/data/data_source/products_data_source.dart' as _i3;
import '../../products/data/data_source/products_data_source_impl.dart' as _i4;
import '../../products/data/repository_impl/products_repository_impl.dart'
    as _i6;
import '../../products/domain/repository/products_repository.dart' as _i5;
import '../../products/domain/use_cases/get_products_use_case.dart' as _i7;
import '../../products/presentation/manager/products_cubit.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ProductsDataSource>(() => _i4.ProductsDataSourceImpl());
    gh.factory<_i5.ProductsRepository>(
        () => _i6.ProductsRepositoryImpl(gh<_i3.ProductsDataSource>()));
    gh.factory<_i7.GetProductsUseCase>(
        () => _i7.GetProductsUseCase(gh<_i5.ProductsRepository>()));
    gh.factory<_i8.ProductsCubit>(
        () => _i8.ProductsCubit(gh<_i7.GetProductsUseCase>()));
    return this;
  }
}
