import 'package:baity_task/src/core/utils/api_service.dart';
import 'package:baity_task/src/features/main_feature/data/repos/home_repo.dart';
import 'package:baity_task/src/features/main_feature/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void setup() {
    getIt.registerLazySingleton<ApiService>(() => ApiService());
    getIt.registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(getIt<ApiService>()));
  }
}
