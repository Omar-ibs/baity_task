import 'dart:convert';
import 'package:baity_task/src/core/error/failure.dart';
import 'package:baity_task/src/core/utils/api_service.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:baity_task/src/features/main_feature/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  const HomeRepoImpl(this.apiService);

  final String _fetchItemsCacheKey = 'cached_real_estate_items';
  final String _filterItemsCacheKeyPrefix = 'cached_real_estate_filtered_';
  final String _fetchItemsTimestampKey = 'cached_real_estate_items_timestamp';
  final String _filterItemsTimestampKeyPrefix =
      'cached_real_estate_filtered_timestamp_';
  final Duration ttl = const Duration(minutes: 30);

  @override
  Future<Either<Failure, List<RealEstate>>> fetchItems() async {
    try {
      //check if there any cached data
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey(_fetchItemsCacheKey) &&
          !_isCacheExpired(prefs.getString(_fetchItemsTimestampKey))) {
        // Retrieve and decode cached data
        final cachedData = prefs.getString(_fetchItemsCacheKey);
        final List decodedData = json.decode(cachedData!);
        final cachedItems =
            decodedData.map((e) => RealEstate.fromJson(e)).toList();
        print('Cached Data');
        return Right(cachedItems);
      }

      //if there is no cached data we will fetch from the API
      List<RealEstate> itemsList = [];
      var response =
          (await apiService.get('/RealEstate', null))["payload"] as List;
      itemsList = response.map((v) => RealEstate.fromJson(v)).toList();
      prefs.setString(_fetchItemsCacheKey,
          json.encode(itemsList.map((e) => e.toJson()).toList()));
      prefs.setString(
          _fetchItemsTimestampKey, DateTime.now().toIso8601String());
      print('Data are caching');
      return Right(itemsList);
    } on DioException catch (errorMessage) {
      return Left(ServerFailure.fromDioError(errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<RealEstate>>> filterItems(
      RealEstate options) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheKey = _generateFilterCacheKey(options);
      // Prepare query parameters based on selected filters
      if (prefs.containsKey(cacheKey)) {
        final cachedData = prefs.getString(cacheKey);
        final List decodedData = json.decode(cachedData!);
        final cachedItems =
            decodedData.map((e) => RealEstate.fromJson(e)).toList();
        return Right(cachedItems);
      }

      Map<String, dynamic> queryParams = {
        if (options.city!.id != null) '/City': options.city!.id,
        if (options.offerType != null) '/OfferType': options.offerType,
        if (options.subCategory!.id != null)
          '/SubCategory': options.subCategory!.id,
      };

      var response =
          (await apiService.get('/RealEstate', queryParams))['payload'] as List;
      List<RealEstate> filteredItems =
          response.map((v) => RealEstate.fromJson(v)).toList();
      prefs.setString(
          cacheKey, json.encode(filteredItems.map((e) => e.toJson()).toList()));
      return Right(filteredItems);
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioError(error));
    }
  }

  bool _isCacheExpired(String? timestampStr) {
    if (timestampStr == null) return true;
    final cachedAt = DateTime.parse(timestampStr);
    return DateTime.now().isAfter(cachedAt.add(ttl));
  }

  String _generateFilterCacheKey(RealEstate options) {
    final cityId = options.city?.id ?? 'any';
    final offerType = options.offerType ?? 'any';
    final subCategoryId = options.subCategory?.id ?? 'any';
    return '$_filterItemsCacheKeyPrefix${cityId}_${offerType}_$subCategoryId';
  }

  String _generateFilterTimestampKey(RealEstate options) {
    final cityId = options.city?.id ?? 'any';
    final offerType = options.offerType ?? 'any';
    final subCategoryId = options.subCategory?.id ?? 'any';
    return '$_filterItemsTimestampKeyPrefix${cityId}_${offerType}_$subCategoryId';
  }
}
