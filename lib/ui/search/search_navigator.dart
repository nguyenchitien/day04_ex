import 'package:day04_ex/ui/search/search_page.dart';
import 'package:flutter/material.dart';

class SearchRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class SearchNavigator extends StatelessWidget {
  SearchNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      SearchRoutes.root: (context) => SearchPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: SearchRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
