import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  FlavorConfig(
    name: AppConfig.flavorDevName,
    variables: {
      AppConfig.apiUrlBase: AppConfig.apiDevUrlBase,
    },
  );
  runApp(
    FlutterBaseApp(),
  );
}
