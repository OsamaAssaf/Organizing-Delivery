import '../../../resources/helpers/all_imports.dart';

class AddRestaurantController extends GetxController {
  final RestaurantsRepository restaurantsRepository;
  AddRestaurantController({required this.restaurantsRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController restaurantNameController;

  @override
  void onInit() {
    restaurantNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    restaurantNameController.dispose();
    super.onClose();
  }

  Future<void> addRestaurant() async {
    if (!formKey.currentState!.validate()) return;
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      Components().showLoading();
      final RestaurantModel restaurantModel = RestaurantModel(
        name: restaurantNameController.text.trim(),
      );
      await restaurantsRepository.addRestaurant(restaurantModel);
      restaurantNameController.clear();
      Components().dismissLoading();
      Components().snackBar(
        message: localizations.doneSuccessfully,
        snackBarStatus: SnackBarStatus.success,
      );
    } catch (_) {
      Components().dismissLoading();
      ExceptionManager().showException();
    }
  }
}
