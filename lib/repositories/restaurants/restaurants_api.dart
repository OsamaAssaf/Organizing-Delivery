import '../../resources/helpers/all_imports.dart';

class RestaurantsApi extends RestaurantsRepository {
  @override
  Future<void> addRestaurant(RestaurantModel restaurantModel) async {
    await FirebaseFirestore.instance.collection('restaurants').add(
          restaurantModel.toJson(),
        );
  }

  @override
  Future<void> deleteRestaurant(String restaurantId) async {
    await FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId)
        .delete();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getRestaurants() {
    return FirebaseFirestore.instance.collection('restaurants').snapshots();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getRestaurantStatus(
      {required String restaurantId}) {
    return FirebaseFirestore.instance
        .collection('restaurant_status')
        .doc(restaurantId)
        .snapshots();
  }

  @override
  Future<void> changeRestaurantStatus({
    required String restaurantId,
    required RestaurantStatus restaurantStatus,
  }) async {
    await FirebaseFirestore.instance
        .collection('restaurant_status')
        .doc(restaurantId)
        .set(
      {
        'status': restaurantStatus.name,
      },
    );
  }
}
