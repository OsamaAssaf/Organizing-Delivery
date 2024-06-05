import '../../resources/helpers/all_imports.dart';

abstract class RestaurantsRepository {
  Future<void> addRestaurant(RestaurantModel restaurantModel);
  Future<void> deleteRestaurant(String restaurantId);

  Stream<QuerySnapshot<Map<String, dynamic>>> getRestaurants();

  Stream<DocumentSnapshot<Map<String, dynamic>>> getRestaurantStatus(
      {required String restaurantId});
  Future<void> changeRestaurantStatus({
    required String restaurantId,
    required RestaurantStatus restaurantStatus,
  });
}
