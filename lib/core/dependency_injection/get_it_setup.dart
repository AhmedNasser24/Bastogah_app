import 'package:bastogah_app/features/global_feature/auth/data/remote_data_source/merchant_auth.dart';
import 'package:bastogah_app/features/global_feature/auth/domain/repos/merchant_auth_repo.dart';
import 'package:bastogah_app/features/global_feature/auth/domain/use_cases/merchant_login_use_case.dart';
import 'package:bastogah_app/features/merchant_feature/home/data/repo/home_repo_impl.dart';
import 'package:bastogah_app/features/merchant_feature/home/domain/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/global_feature/auth/data/remote_data_source/merchant_auth_impl.dart';
import '../../features/global_feature/auth/data/repo/merchant_auth_repo_impl.dart';
import '../../features/global_feature/auth/presentation/manager/merchant_login_cubit/merchant_login_cubit.dart';
import '../../features/merchant_feature/home/data/data_source/remote_data_source/merchant_home_remote_data_source.dart';
import '../../features/merchant_feature/home/data/data_source/remote_data_source/merchant_home_remote_data_source_impl.dart'
    show MerchantHomeRemoteDataSourceImpl;
import '../../features/merchant_feature/home/presentation/manager/cubit/merchant_get_orders_cubit.dart';
import '../api/api_consumer.dart';
import '../api/app_interceptor.dart';
import '../api/dio_consumer.dart';
import '../api/end_point.dart';

final getIt = GetIt.instance;

void getItSetup() {
  // خلي بالك من الترتيب مينفع انادي علي حاجة وهي لسه متعملهاش ريجستير وده بسبب انك مش بتسمي

  // dio config
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );

  getIt.registerSingleton<ApiConsumer>(
    DioConsumer(
      dio: getIt.get<Dio>()
        ..interceptors.add(AppInterceptors(dio: getIt.get<Dio>())),
    ),
  );
  // data source
  getIt.registerLazySingleton<MerchantAuthDataSource>(
    () => MerchantAuthDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );
  getIt.registerLazySingleton<MerchantHomeRemoteDataSource>(
    () =>
        MerchantHomeRemoteDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  // repo
  getIt.registerLazySingleton<MerchantAuthRepo>(
    () =>
        MerchantAuthRepoImpl(merchantAuth: getIt.get<MerchantAuthDataSource>()),
  );
  getIt.registerLazySingleton<MerchantLoginUseCase>(
    () => MerchantLoginUseCase(merchantAuthRepo: getIt.get<MerchantAuthRepo>()),
  );
  getIt.registerLazySingleton<MerchantHomeRepo>(
    () => MerchantHomeRepoImpl(
      merchantHomeRemoteDataSource: getIt.get<MerchantHomeRemoteDataSource>(),
    ),
  );

  // cubit
  getIt.registerFactory<MerchantLoginCubit>(
    () => MerchantLoginCubit(loginUseCase: getIt.get<MerchantLoginUseCase>()),
  );
  getIt.registerFactory<MerchantGetOrdersCubit>(
    () => MerchantGetOrdersCubit(homeRepo: getIt.get<MerchantHomeRepo>()),
  );
}
