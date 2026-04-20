import 'package:flutter/material.dart';

enum AppBottomNavBarTab {
  home,
  bookings,
  activity,
  profile;

  String get label {
    switch (this) {
      case AppBottomNavBarTab.home:
        return 'Home';
      case AppBottomNavBarTab.bookings:
        return 'Bookings';
      case AppBottomNavBarTab.activity:
        return 'Activity';
      case AppBottomNavBarTab.profile:
        return 'Profile';
    }
  }

  IconData get icon {
    switch (this) {
      case AppBottomNavBarTab.home:
        return Icons.home_outlined;
      case AppBottomNavBarTab.bookings:
        return Icons.calendar_today_outlined;
      case AppBottomNavBarTab.activity:
        return Icons.fitness_center_outlined;
      case AppBottomNavBarTab.profile:
        return Icons.person_outline;
    }
  }

  IconData get activeIcon {
    switch (this) {
      case AppBottomNavBarTab.home:
        return Icons.home;
      case AppBottomNavBarTab.bookings:
        return Icons.calendar_today;
      case AppBottomNavBarTab.activity:
        return Icons.fitness_center;
      case AppBottomNavBarTab.profile:
        return Icons.person;
    }
  }
}
