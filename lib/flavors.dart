enum Flavor {
  DEV,
  QA,
  PROD,
}

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'SecretWall dev';
      case Flavor.QA:
        return 'SecretWall qa';
      case Flavor.PROD:
        return 'SecretWall';
      default:
        return 'title';
    }
  }

  static String get serverHost {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'http://192.168.2.110:3000';
      case Flavor.QA:
        return 'http://192.168.2.110:3000';
      case Flavor.PROD:
        return 'http://192.168.2.110:3000';
      default:
        return 'http://localhost:3000';
    }
  }
}
