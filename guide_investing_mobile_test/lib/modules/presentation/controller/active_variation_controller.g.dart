// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_variation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActiveVariationController on _ActiveVariationController, Store {
  late final _$activeVariationGraphAtom =
      Atom(name: '_AssetChangeController.activeVariationGraph', context: context);

  @override
  ObservableList<ActiveVariationGraph> get activeVariationGraph {
    _$activeVariationGraphAtom.reportRead();
    return super.activeVariationGraph;
  }

  @override
  set activeVariationGraph(ObservableList<ActiveVariationGraph> value) {
    _$activeVariationGraphAtom.reportWrite(value, super.activeVariationGraph, () {
      super.activeVariationGraph = value;
    });
  }

  late final _$observableFutureAtom =
      Atom(name: '_AssetChangeController.observableFuture', context: context);

  @override
  ObservableFuture<dynamic> get observableFuture {
    _$observableFutureAtom.reportRead();
    return super.observableFuture;
  }

  @override
  set observableFuture(ObservableFuture<dynamic> value) {
    _$observableFutureAtom.reportWrite(value, super.observableFuture, () {
      super.observableFuture = value;
    });
  }

  late final _$chartDataAtom =
      Atom(name: '_AssetChangeController.chartData', context: context);

  @override
  ObservableList<PricePoint> get chartData {
    _$chartDataAtom.reportRead();
    return super.chartData;
  }

  @override
  set chartData(ObservableList<PricePoint> value) {
    _$chartDataAtom.reportWrite(value, super.chartData, () {
      super.chartData = value;
    });
  }

  late final _$isShowGraphicAtom =
      Atom(name: '_AssetChangeController.isShowGraphic', context: context);

  @override
  bool get isShowGraphic {
    _$isShowGraphicAtom.reportRead();
    return super.isShowGraphic;
  }

  @override
  set isShowGraphic(bool value) {
    _$isShowGraphicAtom.reportWrite(value, super.isShowGraphic, () {
      super.isShowGraphic = value;
    });
  }

  late final _$fetchChartDataAsyncAction =
      AsyncAction('_AssetChangeController.fetchChartData', context: context);

  @override
  Future<void> fetchChartData() {
    return _$fetchChartDataAsyncAction.run(() => super.fetchChartData());
  }

  late final _$_AssetChangeControllerActionController =
      ActionController(name: '_AssetChangeController', context: context);

  @override
  dynamic showGraphic(bool showGraphic) {
    final _$actionInfo = _$_AssetChangeControllerActionController.startAction(
        name: '_AssetChangeController.showGraphic');
    try {
      return super.showGraphic(showGraphic);
    } finally {
      _$_AssetChangeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeVariationGraph: ${activeVariationGraph},
observableFuture: ${observableFuture},
chartData: ${chartData},
isShowGraphic: ${isShowGraphic}
    ''';
  }
}
