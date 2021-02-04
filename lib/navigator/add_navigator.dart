import 'package:day04_ex/routes/route_name.dart';
import 'package:day04_ex/ui/add/add_page.dart';
import 'package:flutter/material.dart';

class AddNavigator extends StatelessWidget {
  const AddNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      RouteNames.add: (context) => AddPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: RouteNames.add,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
