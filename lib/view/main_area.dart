import 'package:blank_mobile/utils.dart';
import 'package:blank_mobile/view/main/dm_screen.dart';
import 'package:blank_mobile/view/main/home_screen.dart';
import 'package:blank_mobile/view/main/notifications_screen.dart';
import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';

import '../widgets/layout/root.dart';

class MainArea extends StatelessWidget {
  const MainArea({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    changeStatusBarColor(colorScheme.background);
    changeNavigationBarColor(colorScheme.background);

    return Root(
        child: BottomNavLayout(
      pages: [
        (_) => const HomeScreen(),
        (_) => const NotificationsScreen(),
        (_) => const DmScreen(),
      ],
      bottomNavigationBar: (currentIndex, onTap) => BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 20,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              activeIcon: Icon(Icons.notifications),
              label: 'Notifications'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.mail_outlined),
              activeIcon: Icon(Icons.mail),
              label: 'Direct Messages'),
        ],
      ),
      savePageState: true,
      pageTransitionData: PageTransitionData(
        builder: PrebuiltAnimationBuilderBuilders.zoomInAndFadeOut,
        duration: 150,
        direction: AnimationDirection.inAndOut,
      ),
    ));
  }
}
