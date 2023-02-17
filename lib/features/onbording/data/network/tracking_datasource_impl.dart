import 'dart:convert';

import 'package:coordinadora_test/core/errors/exceptions.dart';
import 'package:coordinadora_test/features/onbording/data/datasources/tracking_datasource.dart';
import 'package:coordinadora_test/features/onbording/data/model/tracking_model.dart';
import 'package:http/http.dart' as http;

class TrackingDataSourceImpl extends TrackingDataSource {
  TrackingDataSourceImpl();

  @override
  Future<List<TrackingModel>> getTracking() async {
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
          dataList.add(value);
        });

        final trackingList =
            dataList.map((e) => TrackingModel.fromJson(e)).toList();

        return trackingList;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<int>> getDocument() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://us-central1-cm-challenges-api.cloudfunctions.net/api',
        ),
      );
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List<int> dataList = [];

        data['clientes'].forEach((key, value) {
          dataList.add(key);
        });
        print(dataList);

        return dataList;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
