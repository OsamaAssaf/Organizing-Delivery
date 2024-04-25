import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return const UpgradeDialog(
      child: Scaffold(
        appBar: MainAppBar(
          title: 'Home',
          hasDrawer: true,
        ),
        drawer: DrawerHome(),
      ),
    );
  }
}
