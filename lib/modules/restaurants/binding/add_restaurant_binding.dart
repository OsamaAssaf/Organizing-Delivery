import '../../../resources/helpers/all_imports.dart';

class AddRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddRestaurantController(
        restaurantsRepository: RestaurantsApi(),
      ),
    );
  }
}
