import 'package:dio/dio.dart';
import 'package:guide_investing_mobile_test/modules/data/datasource/interface_active_variation_data_source.dart';
import '../../../core/http/client_http.dart';
import '../model/chart_response.dart';

class ActiveVariationDataSource implements IActiveVariationDataSource {

  String baseUrl = 'https://query2.finance.yahoo.com/v8/finance/chart/AAPL';

  ActiveVariationDataSource(Object object);

  @override
  Future<ChartResponse> getActiveVariation() async {
  Response response = await HttpClient.get(baseUrl);
    return ChartResponse.fromJson(response.data);

  }
}
