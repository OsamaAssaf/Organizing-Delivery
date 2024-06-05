import '../helpers/all_imports.dart';

class Routes {
  static const String unDefinedRoute = '/NotFoundView';
  static const String splashRoute = '/SplashView';
  static const String authRoute = '/AuthView';
  static const String navigationRoute = '/NavigationView';
  static const String homeRoute = '/HomeView';
  static const String connectionErrorRoute = '/ConnectionErrorView';
  static const String settingsRoute = '/SettingsView';
  static const String addRestaurantRoute = '/AddRestaurantView';
  static const String restaurantDetailsRoute = '/RestaurantDetailsView';
}

class RouteGenerator {
  static List<GetPage> getPages() {
    return <GetPage>[
      GetPage(
        name: Routes.splashRoute,
        page: () => SplashView(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: Routes.authRoute,
        page: () => AuthView(),
        binding: AuthBinding(),
      ),
      GetPage(
        name: Routes.navigationRoute,
        page: () => const NavigationView(),
        binding: NavigationBinding(),
      ),
      GetPage(
        name: Routes.homeRoute,
        page: () => HomeView(),
      ),
      GetPage(
        name: Routes.connectionErrorRoute,
        page: () => ConnectionErrorView(),
        binding: ConnectionErrorBinding(),
      ),
      GetPage(
        name: Routes.settingsRoute,
        page: () => SettingsView(),
        binding: SettingsBinding(),
      ),
      GetPage(
        name: Routes.addRestaurantRoute,
        page: () => const AddRestaurantView(),
        binding: AddRestaurantBinding(),
      ),
      GetPage(
        name: Routes.restaurantDetailsRoute,
        page: () => const RestaurantDetailsView(),
        binding: RestaurantDetailsBinding(),
      ),
    ];
  }

  static Scaffold unDefinedRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.noRouteFound),
      ),
      body: Center(
        child: Text(localizations.noRouteFound),
      ),
    );
  }
}
