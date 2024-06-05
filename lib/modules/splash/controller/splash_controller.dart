import '../../../resources/helpers/all_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkConnection();
    });
    super.onInit();
  }

  Future<void> checkConnection() async {
    final bool result = await Components().checkConnection();
    if (result == true) {
      Get.offAllNamed(Routes.navigationRoute);
    } else {
      Get.offAllNamed(Routes.connectionErrorRoute);
    }
  }
}
