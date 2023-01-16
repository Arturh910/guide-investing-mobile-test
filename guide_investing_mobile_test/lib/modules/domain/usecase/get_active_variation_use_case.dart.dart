// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import '../../../core/domain/error.dart';
import '../../data/model/chart_response.dart';
import '../repository/interface_active_variation_repository.dart.dart';
import 'interface_get_active_variation_use_case.dart';


class GetActiveVariationUseCase implements IGetActiveVariationUsecase {
  late final IActiveVariationRepository repository;

  GetActiveVariationUseCase(this.repository);

  @override
  Future<Either<Failure, ChartResponse>> call() async {
    return repository.getActiveVariation();
  }
}
