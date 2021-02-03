import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.favorites: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    // for android back button
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(tabIndexers[TabItem.home]);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.search),
            _buildOffstageNavigator(TabItem.add),
            _buildOffstageNavigator(TabItem.favorites),
            _buildOffstageNavigator(TabItem.profile),
          ],
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: tabIcons,
          activeIndex: tabIndexers[_currentTab],
          onTap: _selectTab,
          //other params
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: _buildTabNavigator(tabItem),
    );
  }

  Widget _buildTabNavigator(TabItem tabItem) {
    var navigator;
    switch (tabItem) {
      case TabItem.home:
        navigator = HomeNavigator(
          navigatorKey: _navigatorKeys[tabItem],
        );
        break;
      case TabItem.search:
        navigator = SearchNavigator(
          navigatorKey: _navigatorKeys[tabItem],
        );
        break;
    }

    return navigator;
  }

  void _selectTab(int index) {
    // get current tab
    var tabItem;
    for (var entry in tabIndexers.entries) {
      if (entry.value == index) {
        tabItem = entry.key;
        break;
      }
    }

    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
}
