// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_consumer.dart' as _i207;
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import 'fake_classes.dart' as _i831;
import 'registe_module.dart' as _i846;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
  gh.lazySingleton<_i361.CancelToken>(() => coreInjectableModule.cancelToken());
  gh.singleton<_i207.ApiConsumer>(
    () => coreInjectableModule.dioConsumer(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i831.DataSource>(
    () => _i831.RemoteDataSource(gh<_i207.ApiConsumer>()),
  );
  gh.lazySingleton<_i831.Repo>(() => _i831.RepoImpl(gh<_i831.DataSource>()));
  gh.factory<_i831.Cubit>(() => _i831.Cubit(gh<_i831.Repo>()));
  return getIt;
}

class _$CoreInjectableModule extends _i846.CoreInjectableModule {}
