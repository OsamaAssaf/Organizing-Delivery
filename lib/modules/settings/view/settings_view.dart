import '../../../resources/helpers/all_imports.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.settings,
        canBack: true,
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          GetBuilder<LanguageController>(
            builder: (languageController) {
              return SettingsItem(
                title: localizations.language,
                subtitle: languageController.selectedLanguageLabel,
                icon: Icons.language,
                onTap: () {
                  Components().bottomSheet(
                    context: context,
                    child: GetBuilder<LanguageController>(
                        builder: (languageController) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: languageController.languageList.map((e) {
                          return RadioListTile.adaptive(
                            value: e.code,
                            title: ScaleText(
                              e.name,
                              style: theme.textTheme.titleLarge,
                            ),
                            groupValue: languageController.selectedLanguageCode,
                            onChanged: (String? value) {
                              languageController.changeLanguage(value!);
                              Get.back();
                            },
                          );
                        }).toList(),
                      );
                    }),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
