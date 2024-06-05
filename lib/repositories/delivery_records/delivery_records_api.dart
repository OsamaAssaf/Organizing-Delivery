import '../../resources/helpers/all_imports.dart';

class DeliveryRecordsApi extends DeliveryRecordsRepository {
  @override
  Future<List<DeliveryRecordModel>> getDeliveryRecords(
      {required String restaurantId}) async {
    final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection('delivery_records')
        .where('restaurantId', isEqualTo: restaurantId)
        .get();
    final List<DeliveryRecordModel> result = [];
    for (var e in data.docs) {
      result.add(DeliveryRecordModel.fromJson(e.data()));
    }
    return result;
  }

  @override
  Future<void> addDeliveryRecord({
    required DeliveryRecordModel deliveryRecordModel,
  }) async {
    await FirebaseFirestore.instance.collection('delivery_records').add(
          deliveryRecordModel.toJson(),
        );
  }
}
