import 'package:coordinadora_test/core/errors/failure.dart';
import 'package:coordinadora_test/core/usecases/use_cases.dart';
import 'package:coordinadora_test/features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeParams {
  Map? data;
  HomeParams({this.data});
}

class HomeUseCases extends UseCase<dynamic, HomeParams> {
  final HomeDataRepository repository;
  HomeUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(HomeParams params) async {
    return await repository.postUser(params.data!);
  }
}
