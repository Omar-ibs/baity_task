import 'package:baity_task/src/core/error/failure.dart';
import 'package:baity_task/src/core/utils/api_service.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:baity_task/src/features/main_feature/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  const HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<RealEstate>>> fetchItems() async {
    try {
      List<RealEstate> itemsList = [];
      var response = (await apiService.get('/RealEstate'))["payload"] as List;
      itemsList = response.map((v) => RealEstate.fromJson(v)).toList();
      return Right(itemsList);
    } on DioException catch (errorMessage) {
      return Left(ServerFailure.fromDioError(errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<RealEstate>>> filterItems(String catType) async {
    try {
      List<RealEstate> itemsList = [];
      final response = await apiService.get('');
      itemsList =
          (response as List).map((item) => RealEstate.fromJson(item)).toList();

      return Right(itemsList);
    } on DioException catch (errorMessage) {
      return Left(ServerFailure.fromDioError(errorMessage));
    }
  }
}
