import 'package:bastogah_app/features/global_feature/auth/data/remote_data_source/auth_data_source.dart';
import 'package:bastogah_app/features/global_feature/auth/domain/repos/auth_repo.dart';
import 'package:bastogah_app/features/global_feature/auth/domain/use_cases/login_use_case.dart';
import 'package:bastogah_app/features/global_feature/get_city_region/presentation/manager/city_region_cubit/city_region_cubit.dart';
import 'package:bastogah_app/features/merchant_feature/home/data/repo/home_repo_impl.dart';
import 'package:bastogah_app/features/merchant_feature/home/domain/repo/home_repo.dart';
import 'package:bastogah_app/features/user_feature/favourites/presentation/manager/favourite_cubit/favourite_cubit.dart';
import 'package:bastogah_app/features/user_feature/home/data/data_source/user_home_data_source.dart';
import 'package:bastogah_app/features/user_feature/home/data/data_source/user_home_data_source_impl.dart';
import 'package:bastogah_app/features/user_feature/profile/data/repo/profile_repo_impl.dart';
import 'package:bastogah_app/features/user_feature/profile/domain/repo/profile_repo.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/global_feature/auth/data/remote_data_source/auth_data_source_impl.dart';
import '../../features/global_feature/auth/data/repo/auth_repo_impl.dart';
import '../../features/global_feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/global_feature/get_city_region/data/data_source/city_region_data_source.dart';
import '../../features/global_feature/get_city_region/data/data_source/city_region_data_source_impl.dart';
import '../../features/global_feature/get_city_region/data/repo/city_region_repo_impl.dart';
import '../../features/global_feature/get_city_region/domain/repo/city_region_repo.dart';
import '../../features/merchant_feature/home/data/data_source/remote_data_source/merchant_home_remote_data_source.dart';
import '../../features/merchant_feature/home/data/data_source/remote_data_source/merchant_home_remote_data_source_impl.dart'
    show MerchantHomeRemoteDataSourceImpl;
import '../../features/merchant_feature/home/presentation/manager/merchant_get_orders_cubit/merchant_get_orders_cubit.dart';
import '../../features/user_feature/home/data/repo/user_home_repo_impl.dart';
import '../../features/user_feature/home/domain/repo/user_home_repo.dart';
import '../../features/user_feature/home/presentation/manager/merchant_categories_cubit/merchant_categories_cubit.dart';
import '../../features/user_feature/home/presentation/manager/sliders_cubit/sliders_cubit.dart';
import '../../features/user_feature/home/presentation/manager/user_merchants_cubit/user_merchants_cubit.dart';
import '../../features/user_feature/home/presentation/manager/user_products_cubit/user_products_cubit.dart';
import '../../features/user_feature/profile/data/data_source/profile_data_source.dart';
import '../../features/user_feature/profile/data/data_source/profile_data_source_impl.dart';
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
        ..interceptors.addAll([
          AppInterceptors(dio: getIt.get<Dio>()),
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ]),
    ),
  );
  // data source
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );
  getIt.registerLazySingleton<MerchantHomeRemoteDataSource>(
    () =>
        MerchantHomeRemoteDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<CityRegionDataSource>(
    () => CityRegionDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );
  getIt.registerLazySingleton<CityRegionRepo>(
    () => CityRegionRepoImpl(
      cityRegionDataSource: getIt.get<CityRegionDataSource>(),
    ),
  );
  getIt.registerLazySingleton<UserHomeDataSource>(
    () => UserHomeDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  // repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDataSource: getIt.get<AuthDataSource>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerLazySingleton<MerchantHomeRepo>(
    () => MerchantHomeRepoImpl(
      merchantHomeRemoteDataSource: getIt.get<MerchantHomeRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<UserHomeRepo>(
    () => UserHomeRepoImpl(userHomeDataSource: getIt.get<UserHomeDataSource>()),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(profileDataSource: getIt.get<ProfileDataSource>()),
  );

  // cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginUseCase: getIt.get<LoginUseCase>()),
  );
  getIt.registerFactory<MerchantGetOrdersCubit>(
    () => MerchantGetOrdersCubit(homeRepo: getIt.get<MerchantHomeRepo>()),
  );

  getIt.registerFactory<SlidersCubit>(
    () => SlidersCubit(userHomeRepo: getIt.get<UserHomeRepo>()),
  );
  getIt.registerFactory<MerchantCategoriesCubit>(
    () => MerchantCategoriesCubit(userHomeRepo: getIt.get<UserHomeRepo>()),
  );
  getIt.registerFactory<UserMerchantsCubit>(
    () => UserMerchantsCubit(userHomeRepo: getIt.get<UserHomeRepo>()),
  );
  getIt.registerFactory<UserProductsCubit>(
    () => UserProductsCubit(userHomeRepo: getIt.get<UserHomeRepo>()),
  );
  getIt.registerFactory<CityRegionCubit>(
    () => CityRegionCubit(cityRegionRepo: getIt.get<CityRegionRepo>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(profileRepo: getIt.get<ProfileRepo>()),
  );
  getIt.registerFactory<FavouriteCubit>(() => FavouriteCubit());
}
