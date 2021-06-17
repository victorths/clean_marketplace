import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/navigation/navigation.dart';
import 'core/navigation/routes.dart';
import 'core/theme/theme.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeConfig.themeData,
    );
  }
}
