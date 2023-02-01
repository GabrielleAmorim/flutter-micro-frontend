import 'package:get/get.dart';

import '../ui/screens/screens.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
  ];
}
