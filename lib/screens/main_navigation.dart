import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../widgets/common/bottom_nav_bar.dart';
import 'home/home_screen.dart';
import 'tabs/sell_tab.dart';
import 'tabs/deals_tab.dart';
import 'tabs/profile_tab.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Each tab gets its own navigator key so back-stack is preserved per tab
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            final nav = _navigatorKeys[provider.currentNavIndex].currentState;
            if (nav != null && nav.canPop()) {
              nav.pop();
            }
          },
          child: Scaffold(
            body: IndexedStack(
              index: provider.currentNavIndex,
              children: [
                _buildTabNavigator(0, const HomeScreen()),
                _buildTabNavigator(1, const SellTab()),
                _buildTabNavigator(2, const DealsTab()),
                _buildTabNavigator(3, const ProfileTab()),
              ],
            ),
            bottomNavigationBar: BottomNavBar(
              currentIndex: provider.currentNavIndex,
              onTap: (index) {
                if (index == provider.currentNavIndex) {
                  // Tap active tab → pop to root of that tab
                  _navigatorKeys[index].currentState?.popUntil((r) => r.isFirst);
                } else {
                  provider.setNavIndex(index);
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabNavigator(int index, Widget rootScreen) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => rootScreen,
        settings: settings,
      ),
    );
  }
}
