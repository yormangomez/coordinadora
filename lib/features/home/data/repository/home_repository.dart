import 'package:coordinadora_test/core/errors/exceptions.dart';
import 'package:coordinadora_test/core/errors/failure.dart';
import 'package:coordinadora_test/features/home/data/datasources/home_datasources.dart';
import 'package:dartz/dartz.dart';

abstract class HomeDataRepository {
  Future<Either<Failure, dynamic>> postUser(Map data);
}

class HomeDataRepositoryImpl extends HomeDataRepository {
  final HomeDataSources homeDataSources;

  HomeDataRepositoryImpl({required this.homeDataSources});

  @override
  Future<Either<Failure, dynamic>> postUser(Map data) async {
    try {
      final homeModel = await homeDataSources.postUser(data);

      return Right(homeModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
