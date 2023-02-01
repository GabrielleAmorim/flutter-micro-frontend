import 'package:get/get.dart';

import 'app_routes.dart';

abstract class AppNavigator {
  static final to = _AppNavigatorTo();

  static Future<T?>? offUntil<T>({
    required String routeToOpen,
    String closeUntilRoute = AppRoutes.home,
  }) async =>
      Get.offNamedUntil(
        routeToOpen,
        (route) => !Get.isDialogOpen! && (route.settings.name == closeUntilRoute),
      );

  static Future<T?>? offAllNamed<T>({
    required String routeToOpen,
  }) async =>
      Get.offAllNamed(
        routeToOpen,
      );

  static void back<T>({T? result}) => Get.back<T>(result: result);

  static void until(String routeName) {
    if (routeName.isNotEmpty) {
      Get.until(
        (route) => !Get.isDialogOpen! && (route.settings.name == routeName),
      );
    }
  }
}

class _AppNavigatorTo<T> {
  Future<T?>? home() {
    return Get.toNamed(
      AppRoutes.home,
    );
  }
}
