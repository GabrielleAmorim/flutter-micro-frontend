/// Contains the all configs used in application.
abstract class AppConfig {
  /// Flavor dev name
  static const flavorDevName = 'DEVELOP';

  /// Flavor stg name
  static const flavorStgName = 'STG';

  /// Flavor prod name
  static const flavorProdName = 'PROD';

  /// Url base used in flavor
  static const apiUrlBase = 'apiUrlBase';

  /// ApiBase for Dev
  static const String apiDevUrlBase = "";

  /// ApiBase for Stg
  static const String apiStgUrlBase = "";

  /// ApiBase for Prod
  static const String apiProdUrlBase = "";
}
