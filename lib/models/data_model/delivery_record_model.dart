import '../../resources/helpers/all_imports.dart';

class DeliveryRecordModel {
  double? latitude;
  String? restaurantId;
  String? restaurantName;
  DateTime? timestamp;
  String? status;
  double? longitude;

  DeliveryRecordModel({
    this.latitude,
    this.restaurantId,
    this.restaurantName,
    this.timestamp,
    this.status,
    this.longitude,
  });

  DeliveryRecordModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    timestamp = (json['timestamp'] as Timestamp).toDate();
    status = json['status'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['restaurantId'] = restaurantId;
    data['restaurantName'] = restaurantName;
    data['timestamp'] = timestamp;
    data['timestamp'] = Timestamp.fromDate(timestamp!);
    data['status'] = status;
    data['longitude'] = longitude;
    return data;
  }
}
