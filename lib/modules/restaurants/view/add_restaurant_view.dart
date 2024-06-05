import '../../../resources/helpers/all_imports.dart';

class AddRestaurantView extends GetView<AddRestaurantController> {
  const AddRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.addRestaurant,
        canBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Form(
              key: controller.formKey,
              child: MainTextField(
                controller: controller.restaurantNameController,
                label: localizations.restaurantName,
                validator: ValidatorsManager().validateNotEmpty,
              ),
            ),
            const SizedBox(height: 32.0),
            MainButton(
              title: localizations.add,
              onPressed: controller.addRestaurant,
            ),
          ],
        ),
      ),
    );
  }
}
