import '../../../resources/helpers/all_imports.dart';

class HomeController extends GetxController {
  final RestaurantsRepository restaurantsRepository;

  HomeController({required this.restaurantsRepository});

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getRestaurants();
    });
    super.onInit();
  }

  @override
  void onClose() {
    stream?.cancel();
    super.onClose();
  }

  bool isLoading = true;
  final List<RestaurantModel> restaurantsList = [];
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? stream;
  void getRestaurants() {
    stream = restaurantsRepository
        .getRestaurants()
        .listen((QuerySnapshot<Map<String, dynamic>> value) {
      restaurantsList.clear();
      for (QueryDocumentSnapshot<Map<String, dynamic>> element in value.docs) {
        final RestaurantModel restaurantModel =
            RestaurantModel.fromJson(element.data(), element.id);
        restaurantsList.add(restaurantModel);
      }
      if (isLoading) {
        isLoading = false;
      }
      update();
    });
  }

  Future<void> deleteRestaurant(String restaurantId) async {
    try {
      Components().showLoading();
      await restaurantsRepository.deleteRestaurant(restaurantId);
      Get.back();
      Components().dismissLoading();
      Components().snackBar(
        message: localizations.deleted,
        snackBarStatus: SnackBarStatus.success,
      );
    } catch (_) {
      Components().dismissLoading();
      ExceptionManager().showException();
    }
  }
}
