import '../../../resources/helpers/all_imports.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.index,
    required this.restaurantModel,
    this.deletePressed,
  });
  final int index;
  final RestaurantModel restaurantModel;
  final void Function()? deletePressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ScaleText('${index + 1}'),
      title: ScaleText('${restaurantModel.name}'),
      trailing: IconButton(
        onPressed: () {
          final ScaleText title = ScaleText(
            localizations.areYouSure,
            isFromDialog: true,
          );
          final ScaleText content = ScaleText(
            '${localizations.delete} ${restaurantModel.name} ${Components().isRTL() ? '؟' : '?'}',
            isFromDialog: true,
            style: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.error,
            ),
          );

          final List<Widget> actions = [
            TextButton(
              onPressed: deletePressed,
              child: ScaleText(
                localizations.delete,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: customTheme.error,
                ),
                isFromDialog: true,
              ),
            ),
          ];
          Components().showAdaptiveDialog(
            context: context,
            title: title,
            content: content,
            actions: actions,
          );
        },
        icon: Icon(
          Icons.delete_outline_outlined,
          color: customTheme.error,
        ),
      ),
      onTap: () {
        Get.toNamed(
          Routes.restaurantDetailsRoute,
          arguments: {
            'restaurantModel': restaurantModel,
          },
        );
      },
    );
  }
}
