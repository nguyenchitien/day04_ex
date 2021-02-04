import 'package:day04_ex/routes/route_name.dart';
import 'package:day04_ex/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      RouteNames.profile: (context) => ProfilePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: RouteNames.profile,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
