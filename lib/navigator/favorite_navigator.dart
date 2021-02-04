import 'package:day04_ex/routes/route_name.dart';
import 'package:day04_ex/ui/favorites/favorite_page.dart';
import 'package:day04_ex/ui/favorites/favorites_detail.dart';
import 'package:flutter/material.dart';

class FavoritesNavigator extends StatelessWidget {
  const FavoritesNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      RouteNames.favorites: (context) => FavoritePage(),
      RouteNames.favoritesDetail: (context) => FavoritesDetail(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: RouteNames.favorites,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
