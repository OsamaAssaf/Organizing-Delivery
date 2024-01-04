import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Components.upgrader(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const DrawerHome(),
      ),
    );
  }
}
