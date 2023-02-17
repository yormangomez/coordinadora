import 'dart:convert';

import 'package:coordinadora_test/core/errors/exceptions.dart';
import 'package:coordinadora_test/features/onbording/data/datasources/document_datasource.dart';

import 'package:http/http.dart' as http;

class DocumentDataSourceImpl extends DocumentDataSource {
  DocumentDataSourceImpl();

  @override
  Future<List> getDocument() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://us-central1-cm-challenges-api.cloudfunctions.net/api',
        ),
      );
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List dataList = [];

        data['clientes'].forEach((key, value) {
          dataList.add(key);
        });

        return dataList;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
