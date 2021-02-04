import 'package:day04_ex/routes/route_name.dart';
import 'package:day04_ex/ui/home/home_detail.dart';
import 'package:day04_ex/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      RouteNames.home: (context) => HomePage(),
      RouteNames.homeDetail: (context) => HomeDetail(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: RouteNames.home,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
