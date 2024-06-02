import 'resources/helpers/all_imports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

late AppLocalizations localizations;
late ThemeData theme;
late CustomThemeData customTheme;
late SharedPreferences sharedPreferences;
late PackageInfo packageInfo;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO: remove the comment when config Firebase
  // await FirebaseService().init();
  // FirebaseService().initCrashlytics();
  await Future.wait(
    [
      dotenv.load(),
      SharedPrefsService().init(),
      MasterFunctionsService().initPackageInfo(),
      MasterFunctionsService().initPreferredOrientations(),

      /// TODO: remove the comment when config Firebase
      // NotificationService().initNotifications(),
    ],
  );
  MasterFunctionsService().initSystemUiStyle();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationService().initListenersAndPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        localizations = AppLocalizations.of(context)!;
        return localizations.appName;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(SharedPrefsService().getLanguage()),
      theme: ThemeManager.getLightTheme(),
      // darkTheme: ThemeManager.getDarkTheme(),
      themeMode: SharedPrefsService().getThemeMode(),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      builder: (BuildContext context, Widget? child) {
        theme = Theme.of(context);
        customTheme = theme.extension<CustomThemeData>()!;
        return LoadingPlus(
          loadingWidget: Components().customLoadingItem(),
          child: child!,
        );
      },
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getPages(),
      unknownRoute: GetPage(
        name: Routes.unDefinedRoute,
        page: () => RouteGenerator.unDefinedRoute(),
      ),
    );
  }
}
