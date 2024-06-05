import '../../../resources/helpers/all_imports.dart';

class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  const RestaurantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: MainAppBar(
        title: '${controller.restaurantModel.name}',
        canBack: true,
        actions: [
          GetBuilder<RestaurantDetailsController>(
            builder: (controller) {
              if (controller.isDataLoading || controller.isStatusLoading) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: controller.getDeliveryRecord,
                icon: const Icon(
                  Icons.print_outlined,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<RestaurantDetailsController>(
          builder: (controller) {
            if (controller.isDataLoading || controller.isStatusLoading) {
              return Components().loadingWidget();
            }
            if (controller.hasError) {
              return Center(
                child: ScaleText(
                  localizations.somethingWrongTryAgain,
                ),
              );
            }
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.changeStatus(context);
                    },
                    borderRadius: BorderRadius.circular(width * 0.20),
                    child: Ink(
                      width: width * 0.50,
                      height: width * 0.50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: ScaleText(
                            controller.statusText(),
                            isFromDialog: true,
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
