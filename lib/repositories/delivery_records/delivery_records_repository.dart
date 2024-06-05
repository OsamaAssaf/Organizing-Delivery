import '../../resources/helpers/all_imports.dart';

abstract class DeliveryRecordsRepository {
  Future<List<DeliveryRecordModel>> getDeliveryRecords(
      {required String restaurantId});
  Future<void> addDeliveryRecord({
    required DeliveryRecordModel deliveryRecordModel,
  });
}
