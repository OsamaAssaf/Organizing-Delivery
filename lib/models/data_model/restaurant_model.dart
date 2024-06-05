class RestaurantModel {
  String? id;
  String? name;

  RestaurantModel({this.name});

  RestaurantModel.fromJson(Map<String, dynamic> json, String this.id) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
