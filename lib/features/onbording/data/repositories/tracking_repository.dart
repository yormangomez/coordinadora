import 'package:coordinadora_test/core/errors/exceptions.dart';
import 'package:coordinadora_test/core/errors/failure.dart';
import 'package:coordinadora_test/features/onbording/data/datasources/tracking_datasource.dart';
import 'package:coordinadora_test/features/onbording/data/model/tracking_model.dart';
import 'package:dartz/dartz.dart';

abstract class TrackingRepository {
  Future<Either<Failure, List<TrackingModel>>> getTracking();
}

class TrackingRepositoryImpl extends TrackingRepository {
  final TrackingDataSource trackingDataSources;

  TrackingRepositoryImpl({required this.trackingDataSources});

  @override
  Future<Either<Failure, List<TrackingModel>>> getTracking() async {
    try {
      final trackingModel = await trackingDataSources.getTracking();

      return Right(trackingModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
