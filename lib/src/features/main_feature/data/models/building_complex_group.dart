class BuildingComplexGroup {
  String? id;
  String? name;

  BuildingComplexGroup({
    this.id,
    this.name,
  });

  BuildingComplexGroup.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
