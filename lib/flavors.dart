enum Flavor {
  DEV,
  QA,
  PROD,
}

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

}
