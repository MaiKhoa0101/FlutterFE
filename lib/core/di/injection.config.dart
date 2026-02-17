// dart format width=80
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

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repositories/doctor_repository_impl.dart'
    as _i673;
import '../../features/home/data/repositories/news_repository_impl.dart'
    as _i307;
import '../../features/home/data/repositories/post_repository_impl.dart'
    as _i210;
import '../../features/home/data/repositories/specialty_repository_impl.dart'
    as _i767;
import '../../features/home/domain/repositories/doctor_repository.dart'
    as _i797;
import '../../features/home/domain/repositories/news_repository.dart' as _i866;
import '../../features/home/domain/repositories/post_repository.dart' as _i616;
import '../../features/home/domain/repositories/specialty_repository.dart'
    as _i91;
import '../../features/home/presentation/bloc/doctor_bloc.dart' as _i554;
import '../../features/home/presentation/bloc/news_bloc.dart' as _i677;
import '../../features/home/presentation/bloc/post_bloc.dart' as _i445;
import '../../features/home/presentation/bloc/specialty_bloc.dart' as _i35;
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
    gh.factory<_i362.HomeRemoteDataSource>(
        () => _i362.HomeRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i797.DoctorRepository>(
        () => _i673.DoctorRepositoryImpl(gh<_i362.HomeRemoteDataSource>()));
    gh.factory<_i866.NewsRepository>(
        () => _i307.NewsRepositoryImpl(gh<_i362.HomeRemoteDataSource>()));
    gh.factory<_i91.SpecialtyRepository>(
        () => _i767.SpecialtyRepositoryImpl(gh<_i362.HomeRemoteDataSource>()));
    gh.factory<_i677.NewsBloc>(
        () => _i677.NewsBloc(gh<_i866.NewsRepository>()));
    gh.factory<_i107.AuthRemoteDataSource>(
        () => _i107.AuthRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i616.PostRepository>(
        () => _i210.PostRepositoryImpl(gh<_i362.HomeRemoteDataSource>()));
    gh.factory<_i445.PostBloc>(
        () => _i445.PostBloc(gh<_i616.PostRepository>()));
    gh.factory<_i554.DoctorBloc>(
        () => _i554.DoctorBloc(gh<_i797.DoctorRepository>()));
    gh.factory<_i787.AuthRepository>(
        () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()));
    gh.factory<_i35.SpecialtyBloc>(
        () => _i35.SpecialtyBloc(gh<_i91.SpecialtyRepository>()));
    gh.factory<_i797.AuthBloc>(
        () => _i797.AuthBloc(gh<_i787.AuthRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i614.NetworkModule {}
