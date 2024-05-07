import '../../../resources/helpers/all_imports.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return UpgradeDialog(
      child: GetBuilder<NavigationController>(builder: (controller) {
        return Scaffold(
          body: controller.getPage(),
          // bottomNavigationBar: BottomNavBar(
          //   onTap: (int index) {
          //     controller.changeIndex(index);
          //   },
          //   selectedNavIndex: controller.selectedNavIndex,
          // ),
        );
      }),
    );
  }
}
