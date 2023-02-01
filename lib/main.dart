// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'routes/routes.dart';

class FlutterBaseApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FlutterBaseApp();
}

class _FlutterBaseApp extends State<FlutterBaseApp> {
  @override
  void initState() {
    initEnv();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  Future<void> initEnv() async {
    try {
      await dotenv.load();
    } catch (_) {
      dotenv.testLoad(
        mergeWith: {
          "ACTIVE_LOGGER": "false",
          "ACTIVE_LOGGER_ERROR": "false",
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      location: BannerLocation.topStart,
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        builder: (getCtx, widget) {
          return MediaQuery(
            data: MediaQuery.of(getCtx).copyWith(textScaleFactor: 1),
            child: Stack(
              children: [
                ResponsiveWrapper.builder(
                  widget,
                  minWidth: 360,
                  breakpoints: const [
                    ResponsiveBreakpoint.autoScale(360, name: 'MOBILE-S'),
                    ResponsiveBreakpoint.autoScale(480, name: 'MOBILE-L'),
                    ResponsiveBreakpoint.autoScale(800, name: 'TABLET'),
                  ],
                ),
              ],
            ),
          );
        },
        title: 'Flutter Base',
        getPages: AppPages.routes,
        initialRoute: AppRoutes.home,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
