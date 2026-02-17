// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/inventory/data/datasources/inventory_local_data_source.dart'
    as _i509;
import '../../features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i572;
import '../../features/inventory/domain/repositories/inventory_repository.dart'
    as _i422;
import '../../features/inventory/presentation/bloc/inventory_bloc.dart'
    as _i690;
import '../../features/product/data/datasources/product_local_data_source.dart'
    as _i814;
import '../../features/product/data/repositories/product_repository_impl.dart'
    as _i1040;
import '../../features/product/domain/repositories/product_repository.dart'
    as _i39;
import '../../features/product/presentation/bloc/product_bloc.dart' as _i415;
import '../../features/report/data/repositories/report_repository_impl.dart'
    as _i420;
import '../../features/report/domain/repositories/report_repository.dart'
    as _i23;
import '../../features/report/presentation/bloc/report_bloc.dart' as _i852;
import '../../features/sales/data/datasources/sales_local_data_source.dart'
    as _i430;
import '../../features/sales/data/repositories/sales_repository_impl.dart'
    as _i779;
import '../../features/sales/domain/repositories/sales_repository.dart'
    as _i434;
import '../../features/sales/presentation/bloc/sales_bloc.dart' as _i249;
import '../network/dio_module.dart' as _i614;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i430.SalesLocalDataSource>(
        () => _i430.SalesLocalDataSourceImpl());
    gh.factory<_i509.InventoryLocalDataSource>(
        () => _i509.InventoryLocalDataSourceImpl());
    gh.factory<_i814.ProductLocalDataSource>(
        () => _i814.ProductLocalDataSourceImpl());
    gh.factory<_i39.ProductRepository>(
        () => _i1040.ProductRepositoryImpl(gh<_i814.ProductLocalDataSource>()));
    gh.lazySingleton<_i415.ProductBloc>(
        () => _i415.ProductBloc(gh<_i39.ProductRepository>()));
    gh.factory<_i422.InventoryRepository>(() =>
        _i572.InventoryRepositoryImpl(gh<_i509.InventoryLocalDataSource>()));
    gh.factory<_i434.SalesRepository>(
        () => _i779.SalesRepositoryImpl(gh<_i430.SalesLocalDataSource>()));
    gh.factory<_i690.InventoryBloc>(
        () => _i690.InventoryBloc(gh<_i422.InventoryRepository>()));
    gh.factory<_i249.SalesBloc>(() => _i249.SalesBloc(
          gh<_i434.SalesRepository>(),
          gh<_i422.InventoryRepository>(),
        ));
    gh.factory<_i23.ReportRepository>(() => _i420.ReportRepositoryImpl(
          gh<_i434.SalesRepository>(),
          gh<_i422.InventoryRepository>(),
        ));
    gh.factory<_i852.ReportBloc>(
        () => _i852.ReportBloc(gh<_i23.ReportRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i614.NetworkModule {}
