import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:finjan/core/api/api_consumer.dart';
import 'package:finjan/core/api/api_endpoints.dart';
import 'package:finjan/core/api/api_get.dart';
import 'package:finjan/core/api/api_interceptors.dart';
import 'package:finjan/core/api/category_consumer.dart';
import 'package:finjan/core/api/dio_consumer.dart';
import 'package:finjan/core/api/web_server.dart';
import 'package:finjan/features/auth/data/data/firebase_data_source/firebase_data_source.dart';
import 'package:finjan/features/auth/data/data/firebase_data_source/firebase_data_source_impl.dart';
import 'package:finjan/features/auth/data/data/remote_data.dart';
import 'package:finjan/features/auth/data/repository/fireabse_repo_imp.dart';
import 'package:finjan/features/auth/data/repository/register_repo_impl.dart';
import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';
import 'package:finjan/features/auth/domain/repository/register_repo.dart';
import 'package:finjan/features/auth/domain/usecase/add_new_card_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_cards.dart';
import 'package:finjan/features/auth/domain/usecase/get_create_curren_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/auth/domain/usecase/register_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:finjan/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:finjan/features/auth/presentation/cubit/register_cubit.dart';
import 'package:finjan/features/home/data/remote_data/remote_data.dart';
import 'package:finjan/features/home/data/repository/get_coffe_repo_impl.dart';
import 'package:finjan/features/home/domain/repository/get_coffe_Repository.dart';
import 'package:finjan/features/home/domain/usecase/get_coffe_usecase.dart';
import 'package:finjan/features/home/domain/usecase/hot_coffe_category_usecase.dart';
import 'package:finjan/features/home/domain/usecase/iced_coffe_category_usecase.dart';
import 'package:finjan/features/home/presentation/cubit/add_card_cubit.dart';
import 'package:finjan/features/home/presentation/cubit/cubit/coffee_category_cubit.dart';
import 'package:finjan/features/home/presentation/cubit/get_coffe_cubit.dart';
import 'package:finjan/features/layout/screens/cubit/layout_cubit_cubit.dart';
import 'package:finjan/features/orders/cubit/get_cards_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  //bloc
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(registerUseCase: sl()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(
      signUPUsecase: sl(),
      getCreateCurrentUserUsecase: sl(),
      signInUsecase: sl(),
      getUserCurrentUidUsecase: sl()));
  sl.registerFactory<GetCoffeCubit>(
      () => GetCoffeCubit(usecase: sl(), getUserCurrentUidUsecase: sl()));
  sl.registerFactory<AddCardCubit>(() =>
      AddCardCubit(addNewCardUseCase: sl(), getUserCurrentUidUsecase: sl()));
  sl.registerFactory<LayoutCubitCubit>(
      () => LayoutCubitCubit(getUserCurrentUidUsecase: sl()));
  sl.registerFactory<GetCardsCubit>(() =>
      GetCardsCubit(getCardsUsecase: sl(), getUserCurrentUidUsecase: sl()));
  sl.registerFactory<CoffeeCategoryCubit>(() => CoffeeCategoryCubit(
      hotCoffeCategoryUsecase: sl(), icedCoffeCategoryUsecase: sl()));
  //usecase
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(registerRepository: sl()));
  sl.registerLazySingleton<GetCoffeUsecase>(
      () => GetCoffeUsecase(repository: sl()));
  sl.registerLazySingleton<SignUPUsecase>(
      () => SignUPUsecase(repository: sl()));
  sl.registerLazySingleton<GetCreateCurrentUserUsecase>(
      () => GetCreateCurrentUserUsecase(repository: sl()));
  sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(repository: sl()));
  sl.registerLazySingleton<AddNewCardUseCase>(
      () => AddNewCardUseCase(repository: sl()));
  sl.registerLazySingleton<GetUserCurrentUidUsecase>(
      () => GetUserCurrentUidUsecase(repository: sl()));
  sl.registerLazySingleton<GetCardsUsecase>(
      () => GetCardsUsecase(repository: sl()));
  sl.registerLazySingleton<HotCoffeCategoryUsecase>(
      () => HotCoffeCategoryUsecase(getCoffeRepository: sl()));
  sl.registerLazySingleton<IcedCoffeCategoryUsecase>(
      () => IcedCoffeCategoryUsecase(getCoffeRepository: sl()));
  //repository
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(auth: sl(), firestore: sl()));
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImp(remoteDataSource: sl()));
  sl.registerLazySingleton<GetCoffeRepository>(
      () => GetCoffeRepositoryImpl(remoteData: sl()));
  //sl.registerLazySingleton(() => );
  //remote data source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RemoteData>(() =>
      RemoteDataImpl(apiConsumer: sl(), dioHelper: sl(), apiService: sl()));
  //Api
  // sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioHelper(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(
        client: sl(),
      ));
  sl.registerLazySingleton(() => ApiService(APIEndPoints.coffeBasUrl));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
