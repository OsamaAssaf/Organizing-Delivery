import '../helpers/all_imports.dart';
import '../helpers/conflict_imports.dart';

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
      canDismissDialog: false,
      dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material,
      child: child,
    );
  }
}
