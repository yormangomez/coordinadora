import 'package:coordinadora_test/features/onbording/data/model/tracking_model.dart';

abstract class TrackingDataSource {
  Future<List<TrackingModel>> getTracking();
}
