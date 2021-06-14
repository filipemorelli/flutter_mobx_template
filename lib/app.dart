import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/flavors.dart';
import 'package:flutter_mobx_template/routes/route_names.dart';
import 'package:flutter_mobx_template/routes/routes.dart';
import 'package:flutter_mobx_template/services/api.dart';
import 'package:flutter_mobx_template/services/providers.dart';
import 'package:flutter_mobx_template/themes/dark_theme.dart';
import 'package:flutter_mobx_template/themes/light_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: F.title,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: RouteNames.initialRoute,
        routes: routes,
      ),
    );
  }
}
