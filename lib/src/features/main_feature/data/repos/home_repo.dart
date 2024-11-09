import 'package:baity_task/src/core/error/failure.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<RealEstate>>> fetchItems();
  Future<Either<Failure, List<RealEstate>>> filterItems();
}
