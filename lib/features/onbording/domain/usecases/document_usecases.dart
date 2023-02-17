import 'package:coordinadora_test/core/errors/failure.dart';
import 'package:coordinadora_test/core/usecases/use_cases.dart';
import 'package:coordinadora_test/features/onbording/data/repositories/document_repository.dart';
import 'package:dartz/dartz.dart';

class TrackingParams {
  TrackingParams();
}

class DocumentUseCases extends UseCase<List, TrackingParams> {
  final DocumentRepository repository;
  DocumentUseCases({required this.repository});

  @override
  Future<Either<Failure, List>> call(TrackingParams params) async {
    return await repository.getDocument();
  }
}
