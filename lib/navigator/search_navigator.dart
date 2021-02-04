import 'package:day04_ex/routes/route_name.dart';
import 'package:day04_ex/ui/search/search_page.dart';
import 'package:flutter/material.dart';

class SearchNavigator extends StatelessWidget {
  const SearchNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      RouteNames.search: (context) => SearchPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: RouteNames.search,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
