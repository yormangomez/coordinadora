import 'package:coordinadora_test/core/errors/failure.dart';
import 'package:coordinadora_test/core/usecases/use_cases.dart';
import 'package:coordinadora_test/features/onbording/data/model/tracking_model.dart';
import 'package:coordinadora_test/features/onbording/data/repositories/tracking_repository.dart';
import 'package:dartz/dartz.dart';

class TrackingParams {
  TrackingParams();
}

class TrackingUseCases extends UseCase<List<TrackingModel>, TrackingParams> {
  final TrackingRepository repository;
  TrackingUseCases({required this.repository});

  @override
  Future<Either<Failure, List<TrackingModel>>> call(
      TrackingParams params) async {
    return await repository.getTracking();
  }
}
