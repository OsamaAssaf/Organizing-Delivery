import '../../../resources/helpers/all_imports.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavigationController(),
    );
  }
}
