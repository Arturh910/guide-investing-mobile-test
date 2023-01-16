
import 'package:guide_investing_mobile_test/modules/data/model/chart_response.dart';
import 'package:guide_investing_mobile_test/modules/presentation/util/price_point.dart';
import 'package:intl/intl.dart';
import 'package:load/load.dart';
import 'package:mobx/mobx.dart';
import '../../data/model/chart.dart';
import '../../domain/usecase/interface_get_active_variation_use_case.dart';
import '../util/active_variation_graph.dart';

part 'active_variation_controller.g.dart';

// ignore: library_private_types_in_public_api
class ActiveVariationController = _ActiveVariationController
    with _$ActiveVariationController;

abstract class _ActiveVariationController with Store {
  final percentage = 100;

  @observable
  ObservableList<ActiveVariationGraph> activeVariationGraph =
      ObservableList<ActiveVariationGraph>();
  @observable
  ObservableFuture observableFuture = ObservableFuture.value(null);

  @observable
  ObservableList<PricePoint> chartData = ObservableList<PricePoint>();

  @observable
  bool isShowGraphic = false;

  late final IGetActiveVariationUsecase getActiveVariationUsecase;

  _ActiveVariationController(this.getActiveVariationUsecase);

  @action
  showGraphic(bool showGraphic) => isShowGraphic = showGraphic;

  @action
  Future<void> fetchChartData() async {
    showLoadingDialog();

    final useCase = await getActiveVariationUsecase();
    final chartResponse =
        useCase.fold((l) => ChartResponse(Chart([])), (r) => r);

    final chartResult = chartResponse.chart.chartResult[0];

    // extract the last 30 records
    List<double> prices = chartResult.getLastestPrices(limit: 30);

    // extract the last 30 records
    final currentTimes = chartResult.getLastestTimes(limit: 30);

    // convert timestamp for datetime
    List<DateTime> dates = [];
    for (var time in currentTimes) {
      dates.add(DateTime.fromMillisecondsSinceEpoch(time));
    }

    // calculate table data
    observableFuture = ObservableFuture(_calculateTableData(prices, dates));

    // apply chart values
    _bindChartData();

    hideLoadingDialog();
  }

  _bindChartData() async {
    if (activeVariationGraph.isNotEmpty) {
      for (var item in activeVariationGraph) {
        chartData.add(PricePoint(item.day.toDouble(), item.price));
      }
    }
  }

  _calculateTableData(List<double> prices, List<DateTime> dates) async {
    int count = 0;
    double variationDMinusOne = 0;
    double variationFirstDate = 0;

    for (var price in prices) {
      if (count > 0 && price > 0) {
        variationDMinusOne =
            _calculateVariance(count, price, prices[count - 1]);
        variationFirstDate = _calculateVariance(count, price, prices[0]);
      }

      activeVariationGraph.add(ActiveVariationGraph(
          day: count,
          date: _formatDate(dates[count]),
          price: price,
          percent: variationDMinusOne,
          percentFirstDate: variationFirstDate));

      variationDMinusOne = 0;
      variationFirstDate = 0;
      count++;
    }
  }

  _calculateVariance(int index, double currentPrice, double nextPrice) {
    double result = 0.0;
    final currentResult = _getPercent(currentPrice, nextPrice);

    result = (currentResult > percentage)
        ? (currentResult - percentage)
        : (percentage - currentResult);

    return result;
  }

  double _getPercent(double number, double nextNumber) =>
      (number * 100 / nextNumber);

  /// set in an extension
  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat.yMd();
    final String formatted = formatter.format(date);
    return formatted;
  }
}
