import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(
    HomeController(
      restaurantsRepository: RestaurantsApi(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return UpgradeDialog(
      child: Scaffold(
        appBar: MainAppBar(
          title: localizations.home,
          hasDrawer: true,
        ),
        drawer: const DrawerHome(),
        body: GetBuilder<HomeController>(builder: (controller) {
          if (controller.isLoading) {
            return Components().loadingWidget();
          }
          if (controller.restaurantsList.isEmpty) {
            return Center(
              child: ScaleText(
                localizations.youHaveNotAddedRestaurantsYet,
              ),
            );
          }
          return ListView.separated(
            itemCount: controller.restaurantsList.length,
            itemBuilder: (BuildContext context, int index) {
              final RestaurantModel restaurantModel =
                  controller.restaurantsList.elementAt(index);
              return RestaurantWidget(
                index: index,
                restaurantModel: restaurantModel,
                deletePressed: () {
                  controller.deleteRestaurant(restaurantModel.id!);
                },
              );
            },
            separatorBuilder: (_, __) {
              return Divider(
                color: customTheme.grey,
              );
            },
          );
        }),
      ),
    );
  }
}
