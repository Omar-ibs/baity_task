import 'package:baity_task/src/features/main_feature/data/models/building_complex_group.dart';
import 'package:baity_task/src/features/main_feature/data/models/category.dart';
import 'package:baity_task/src/features/main_feature/data/models/city.dart';
import 'package:baity_task/src/features/main_feature/data/models/country.dart';
import 'package:baity_task/src/features/main_feature/data/models/district.dart';
import 'package:baity_task/src/features/main_feature/data/models/sub_category.dart';
import 'package:baity_task/src/features/main_feature/data/models/sub_district.dart';

class RealEstate {
  String? id;
  String? createdAt;
  String? title;
  String? ownerType;
  String? ownerName;
  String? ownerImageUrl;
  String? offerType;
  double? lat;
  double? lng;
  double? price;
  double? area;
  int? views;
  int? imagesCount;
  bool? hasVideo;
  bool? isUrgent;
  int? age;
  dynamic noOfRooms;
  dynamic noOfBedRooms;
  int? noOfBathRooms;
  int? noOfLivingRooms;
  dynamic noOfFloors;
  int? parkingCapacity;
  String? image;
  BuildingComplexGroup? buildingComplexGroup;
  Country? country;
  City? city;
  District? district;
  SubDistrict? subDistrict;
  Category? category;
  SubCategory? subCategory;

  RealEstate({
    this.id,
    this.createdAt,
    this.title,
    this.ownerType,
    this.ownerName,
    this.ownerImageUrl,
    this.offerType,
    this.lat,
    this.lng,
    this.price,
    this.area,
    this.views,
    this.imagesCount,
    this.hasVideo,
    this.isUrgent,
    this.age,
    this.noOfRooms,
    this.noOfBedRooms,
    this.noOfBathRooms,
    this.noOfLivingRooms,
    this.noOfFloors,
    this.parkingCapacity,
    this.image,
    this.buildingComplexGroup,
    this.country,
    this.city,
    this.district,
    this.subDistrict,
    this.category,
    this.subCategory,
  });

  RealEstate.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    title = json['title'];
    ownerType = json['ownerType'];
    ownerName = json['ownerName'];
    ownerImageUrl = json['ownerImageUrl'];
    offerType = json['offerType'];
    lat = json['lat'];
    lng = json['lng'];
    price = json['price'];
    area = json['area'];
    views = json['views'];
    imagesCount = json['imagesCount'];
    hasVideo = json['hasVideo'];
    isUrgent = json['isUrgent'];
    age = json['age'];
    noOfRooms = json['noOfRooms'];
    noOfBedRooms = json['noOfBedRooms'];
    noOfBathRooms = json['noOfBathRooms'];
    noOfLivingRooms = json['noOfLivingRooms'];
    noOfFloors = json['noOfFloors'];
    parkingCapacity = json['parkingCapacity'];
    image = json['image'];
    buildingComplexGroup = json['buildingComplexGroup'] != null
        ? BuildingComplexGroup.fromJson(json['buildingComplexGroup'])
        : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    subDistrict = json['subDistrict'] != null
        ? SubDistrict.fromJson(json['subDistrict'])
        : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['title'] = title;
    map['ownerType'] = ownerType;
    map['ownerName'] = ownerName;
    map['ownerImageUrl'] = ownerImageUrl;
    map['offerType'] = offerType;
    map['lat'] = lat;
    map['lng'] = lng;
    map['price'] = price;
    map['area'] = area;
    map['views'] = views;
    map['imagesCount'] = imagesCount;
    map['hasVideo'] = hasVideo;
    map['isUrgent'] = isUrgent;
    map['age'] = age;
    map['noOfRooms'] = noOfRooms;
    map['noOfBedRooms'] = noOfBedRooms;
    map['noOfBathRooms'] = noOfBathRooms;
    map['noOfLivingRooms'] = noOfLivingRooms;
    map['noOfFloors'] = noOfFloors;
    map['parkingCapacity'] = parkingCapacity;
    map['image'] = image;
    if (buildingComplexGroup != null) {
      map['buildingComplexGroup'] = buildingComplexGroup?.toJson();
    }
    if (country != null) {
      map['country'] = country?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    if (district != null) {
      map['district'] = district?.toJson();
    }
    if (subDistrict != null) {
      map['subDistrict'] = subDistrict?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    return map;
  }
}
