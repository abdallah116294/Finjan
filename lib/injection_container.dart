import 'package:dio/dio.dart';
import 'package:finjan/core/api/api_consumer.dart';
import 'package:finjan/core/api/api_interceptors.dart';
import 'package:finjan/core/api/dio_consumer.dart';
import 'package:finjan/features/auth/data/data/remote_data.dart';
import 'package:finjan/features/auth/data/repository/register_repo_impl.dart';
import 'package:finjan/features/auth/domain/repository/register_repo.dart';
import 'package:finjan/features/auth/domain/usecase/register_usecase.dart';
import 'package:finjan/features/auth/presentation/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //bloc
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(registerUseCase: sl()));
  //usecase
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(registerRepository: sl()));
  //repository
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(remoteDataSource: sl()));
  //remote data source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(apiConsumer: sl()));
  //Api
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
}
