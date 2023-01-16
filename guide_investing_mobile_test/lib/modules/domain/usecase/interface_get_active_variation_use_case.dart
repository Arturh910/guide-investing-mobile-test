import 'package:dartz/dartz.dart';

import '../../../core/domain/error.dart';
import '../../data/model/chart_response.dart';

abstract class IGetActiveVariationUsecase {
  Future<Either<Failure, ChartResponse>> call();
}
