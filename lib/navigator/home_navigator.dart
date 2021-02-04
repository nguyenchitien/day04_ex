import 'package:day04_ex/ui/home/home_detail.dart';
import 'package:day04_ex/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      HomeRoutes.root: (context) => HomePage(),
      HomeRoutes.detail: (context) => HomeDetail(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
