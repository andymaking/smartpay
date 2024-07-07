import 'network_config.dart';

// ENUMS FOR DIFFERENT ENVIRONMENTS
enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

// ENVIRONMENT CONFIGURATION FOR BASE URL
class Config {
  static Flavor? appFlavor;

  static String get BASEURL {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return NetworkConfig.DEVELOP_BASE_URL;
      case Flavor.RELEASE:
        return NetworkConfig.RELEASE_BASE_URL;
      default:
        return '';
    }
  }
}