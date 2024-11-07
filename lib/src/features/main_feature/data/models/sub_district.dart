class SubDistrict {
  String? id;
  String? name;

  SubDistrict({
    this.id,
    this.name,
  });

  SubDistrict.fromJson(dynamic json) {
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
