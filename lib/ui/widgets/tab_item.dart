import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabItem { home, search, add, favorites, profile }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.search: 'search',
  TabItem.add: 'add',
  TabItem.favorites: 'favorites',
  TabItem.profile: 'profile',
};

const Map<TabItem, int> tabIndexers = {
  TabItem.home: 0,
  TabItem.search: 1,
  TabItem.add: 2,
  TabItem.favorites: 3,
  TabItem.profile: 4,
};

const List<IconData> tabIcons = [
  Icons.home,
  Icons.search,
  Icons.add,
  FontAwesomeIcons.heart,
  Icons.account_circle_outlined,
];
