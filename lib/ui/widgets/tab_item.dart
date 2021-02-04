import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabItem { home, search, add, favorites, profile }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.search: 'search',
  TabItem.favorites: 'favorites',
  TabItem.profile: 'profile',
};

const Map<TabItem, int> tabIndexers = {
  TabItem.home: 0,
  TabItem.search: 1,
  TabItem.favorites: 2,
  TabItem.profile: 3,
};

const List<IconData> tabIcons = [
  Icons.home,
  Icons.search,
  FontAwesomeIcons.heart,
  Icons.account_circle_outlined,
];
