import '../helpers/all_imports.dart';

class UpgradeDialog extends StatelessWidget {
  const UpgradeDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        messages: UpgraderMessages(
          code: Get.locale!.languageCode,
        ),
        debugDisplayAlways: false,
        debugLogging: false,
        durationUntilAlertAgain: const Duration(minutes: 1),
      ),
      shouldPopScope: () => false,
      showIgnore: false,
      showLater: false,
      barrierDismissible: false,
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      child: child,
    );
  }
}
