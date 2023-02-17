import 'package:coordinadora_test/core/bloc/global_bloc.dart';
import 'package:coordinadora_test/features/home/data/datasources/home_datasources.dart';
import 'package:coordinadora_test/features/home/data/repository/home_repository.dart';
import 'package:coordinadora_test/features/home/domain/usecases/home_usecases.dart';
import 'package:coordinadora_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:coordinadora_test/features/onbording/data/datasources/document_datasource.dart';
import 'package:coordinadora_test/features/onbording/data/datasources/tracking_datasource.dart';
import 'package:coordinadora_test/features/onbording/data/network/document_datasource_impl.dart';
import 'package:coordinadora_test/features/onbording/data/network/tracking_datasource_impl.dart';
import 'package:coordinadora_test/features/onbording/data/repositories/document_repository.dart';
import 'package:coordinadora_test/features/onbording/data/repositories/tracking_repository.dart';
import 'package:coordinadora_test/features/onbording/domain/usecases/document_usecases.dart';
import 'package:coordinadora_test/features/onbording/domain/usecases/tracking_usecases.dart';
import 'package:coordinadora_test/features/onbording/presentation/bloc/onbording_bloc.dart';

import 'package:get_it/get_it.dart';

import 'features/home/data/network/home_datasources_impl.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() => GlobalBloc());
  sl.registerFactory(() => HomeBloc(homeUseCases: sl()));
  sl.registerFactory(() => OnbordingBloc(
        trackingUseCases: sl(),
        documentUseCases: sl(),
      ));

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => HomeUseCases(repository: sl()));
  sl.registerLazySingleton(() => TrackingUseCases(repository: sl()));
  sl.registerLazySingleton(() => DocumentUseCases(repository: sl()));

  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<HomeDataRepository>(
      () => HomeDataRepositoryImpl(homeDataSources: sl()));
  sl.registerLazySingleton<TrackingRepository>(
      () => TrackingRepositoryImpl(trackingDataSources: sl()));
  sl.registerLazySingleton<DocumentRepository>(
      () => DocumentRepositoryImpl(documentDataSources: sl()));

  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<HomeDataSources>(() => HomeDataSourceImpl());
  sl.registerLazySingleton<TrackingDataSource>(() => TrackingDataSourceImpl());
  sl.registerLazySingleton<DocumentDataSource>(() => DocumentDataSourceImpl());
}
