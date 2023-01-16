import 'package:get_it/get_it.dart';
import 'package:guide_investing_mobile_test/modules/data/repository/active_variation_repository.dart.dart';
import 'package:guide_investing_mobile_test/modules/domain/repository/interface_active_variation_repository.dart.dart';
import 'package:guide_investing_mobile_test/modules/domain/usecase/get_active_variation_use_case.dart.dart';
import 'package:guide_investing_mobile_test/modules/domain/usecase/interface_get_active_variation_use_case.dart';
import 'package:guide_investing_mobile_test/modules/presentation/controller/active_variation_controller.dart';
import '../../modules/data/datasource/active_variation_data_source.dart.dart';
import '../../modules/data/datasource/interface_active_variation_data_source.dart';


void initializeDi(GetIt getIt) async {
  initializeDatasource(getIt);
  initializeRepository(getIt);
  initializeUseCases(getIt);
  initializeControllers(getIt);
}

void initializeDatasource(GetIt getIt) {
  getIt.registerFactory<IActiveVariationDataSource>(() => ActiveVariationDataSource(getIt));
}

void initializeRepository(GetIt getIt) {
  getIt.registerFactory<IActiveVariationRepository>(
      () => ActiveVariationRepository(getIt()));
}


void initializeUseCases(GetIt getIt) {
  getIt.registerFactory<IGetActiveVariationUsecase>(
      () => GetActiveVariationUseCase(getIt()));
}

void initializeControllers(GetIt getIt) {
  getIt.registerLazySingleton(() => ActiveVariationController(getIt()));
}
