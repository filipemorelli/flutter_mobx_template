import 'package:flutter_mobx_template/env/env.dart';
import 'package:flutter_mobx_template/env/env_dev.dart';
import 'package:flutter_mobx_template/env/env_prod.dart';
import 'package:flutter_mobx_template/env/env_qa.dart';

enum Flavor {
  DEV,
  QA,
  PROD,
}

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor? appFlavor;

  static Env get env {
    switch (appFlavor) {
      case Flavor.DEV:
        return Env.fromJson(envDev);
      case Flavor.QA:
        return Env.fromJson(envQa);
      case Flavor.PROD:
        return Env.fromJson(envProd);
      default:
        return Env.fromJson(envProd);
    }
  }
}
