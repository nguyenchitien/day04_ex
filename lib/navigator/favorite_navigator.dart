import 'package:day04_ex/ui/favorites/favorite_page.dart';
import 'package:day04_ex/ui/favorites/favorites_detail.dart';
import 'package:flutter/material.dart';

class FavoritesRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class FavoritesNavigator extends StatelessWidget {
  const FavoritesNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      FavoritesRoutes.root: (context) => FavoritePage(),
      FavoritesRoutes.detail: (context) => FavoritesDetail(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: FavoritesRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
