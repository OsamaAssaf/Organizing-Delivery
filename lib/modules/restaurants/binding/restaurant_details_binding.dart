import '../../../resources/helpers/all_imports.dart';

class RestaurantDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestaurantDetailsController(
        deliveryRecordsRepository: DeliveryRecordsApi(),
        restaurantsRepository: RestaurantsApi(),
      ),
    );
  }
}
