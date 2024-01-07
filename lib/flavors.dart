enum Flavor {
  noneprod,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.noneprod:
        return 'Gelivery Tracker';
      case Flavor.prod:
        return 'Gelivery Tracker';
      default:
        return 'title';
    }
  }

}
