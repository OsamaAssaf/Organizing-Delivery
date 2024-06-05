import '../../../resources/helpers/all_imports.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.leading,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final Widget? leading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ScaleText(
        title,
        style: theme.textTheme.titleLarge,
      ),
      subtitle: subtitle != null
          ? ScaleText(
              subtitle!,
              style: theme.textTheme.titleMedium,
            )
          : null,
      leading: leading ??
          Icon(
            icon,
            size: 24.0,
            color: theme.colorScheme.primary,
          ),
      trailing: onTap != null
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.0,
              color: theme.colorScheme.primary,
            )
          : null,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
