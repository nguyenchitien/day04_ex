import 'package:day04_ex/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';

class ProfileRoutes {
  static const String root = '/';
}

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      ProfileRoutes.root: (context) => ProfilePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
