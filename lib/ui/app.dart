import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:day04_ex/navigator/add_navigator.dart';
import 'package:day04_ex/navigator/favorite_navigator.dart';
import 'package:day04_ex/navigator/home_navigator.dart';
import 'package:day04_ex/navigator/profile_navigator.dart';
import 'package:day04_ex/navigator/search_navigator.dart';
import 'package:day04_ex/ui/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.add: GlobalKey<NavigatorState>(),
    TabItem.favorites: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    // for android back button
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab].currentState.maybePop();
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
        floatingActionButton: FloatingActionButton(
          elevation: 8,
          backgroundColor: Color(0xFFFFA400),
          child: Icon(
            Icons.add,
            color: Color(0xFF373A36),
          ),
          onPressed: _handleAddNavigator,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: tabIcons.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Color(0xFFFFA400) : Colors.white;
            return Container(
              width: 100,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    tabIcons[index],
                    size: 20,
                    color: color,
                  ),
                ],
              ),
            );
          },
          backgroundColor: Color(0xFF373A36),
          activeIndex: _currentTab == TabItem.add ? -1 : tabIndexers[_currentTab],
          splashColor: Color(0xFFFFA400),
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          onTap: _selectTab,
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
      case TabItem.add:
        navigator = AddNavigator(
          navigatorKey: _navigatorKeys[tabItem],
        );
        break;
      case TabItem.favorites:
        navigator = FavoritesNavigator(
          navigatorKey: _navigatorKeys[tabItem],
        );
        break;
      case TabItem.profile:
        navigator = ProfileNavigator(
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

  void _handleAddNavigator() {
    if (_currentTab == TabItem.add) {
      _navigatorKeys[TabItem.add].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = TabItem.add);
    }
  }
}
