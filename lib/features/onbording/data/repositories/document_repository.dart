import 'package:coordinadora_test/core/errors/exceptions.dart';
import 'package:coordinadora_test/core/errors/failure.dart';
import 'package:coordinadora_test/features/onbording/data/datasources/document_datasource.dart';

import 'package:dartz/dartz.dart';

abstract class DocumentRepository {
  Future<Either<Failure, List>> getDocument();
}

class DocumentRepositoryImpl extends DocumentRepository {
  final DocumentDataSource documentDataSources;

  DocumentRepositoryImpl({required this.documentDataSources});

  @override
  Future<Either<Failure, List>> getDocument() async {
    try {
      final documentModel = await documentDataSources.getDocument();

      return Right(documentModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
