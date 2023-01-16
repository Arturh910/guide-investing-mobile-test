import 'package:guide_investing_mobile_test/modules/domain/repository/interface_active_variation_repository.dart.dart';

import '../../../core/domain/error.dart';
import '../datasource/interface_active_variation_data_source.dart';
import '../model/chart_response.dart';
import 'package:dartz/dartz.dart';

class ActiveVariationRepository implements IActiveVariationRepository {
  final IActiveVariationDataSource activeVariationDataSource;

  ActiveVariationRepository(this.activeVariationDataSource);


  @override
  Future<Either<Failure, ChartResponse>> getActiveVariation() async {
    return Right(await activeVariationDataSource.getActiveVariation());
  }
}


