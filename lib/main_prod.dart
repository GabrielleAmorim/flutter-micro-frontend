import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  FlavorConfig(
    name: AppConfig.flavorProdName,
    variables: {
      AppConfig.apiUrlBase: AppConfig.apiProdUrlBase,
    },
  );
  runApp(
    FlutterBaseApp(),
  );
}
