import '../../../resources/helpers/all_imports.dart';

class NavigationController extends GetxController {
  final List<Widget> pages = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  int selectedNavIndex = 0;
  void changeIndex(int value) {
    selectedNavIndex = value;
    update();
  }

  Widget getPage() {
    return pages.elementAt(selectedNavIndex);
  }
}
