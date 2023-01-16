import '../model/chart_response.dart';

abstract class IActiveVariationDataSource {
  Future<ChartResponse> getActiveVariation();
}
