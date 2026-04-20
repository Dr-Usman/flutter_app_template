import 'package:flutter/material.dart';
import 'package:shapes/core/enums/app_bottom_navbar_tab.dart';
import 'package:shapes/modules/activity/activity_screen.dart';
import 'package:shapes/modules/bookings/bookings_screen.dart';
import 'package:shapes/modules/home/home_screen.dart';
import 'package:shapes/modules/profile/profile_screen.dart';
import 'package:shapes/shared/widgets/navigation/custom_app_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppBottomNavBarTab _currentTab = AppBottomNavBarTab.home;

  static const List<Widget> _screens = [
    HomeScreen(),
    BookingsScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(AppBottomNavBarTab tab) {
    if (tab == _currentTab) return;
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentTab.index, children: _screens),
      // body: _screens[_currentTab.index],
      bottomNavigationBar: CustomAppBottomNavigationBar(
        currentTab: _currentTab,
        onTabSelected: (tab) {
          _onTabSelected(tab);
        },
      ),
    );
  }
}
