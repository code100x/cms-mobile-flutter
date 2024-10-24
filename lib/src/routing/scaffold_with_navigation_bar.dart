import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.blue,
          backgroundColor: const Color(0xFFF1F5F9),
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
                label: 'My Courses',
                icon: Icon(Icons.play_circle_outline_outlined)),
            NavigationDestination(
                label: 'Downloads', icon: Icon(Icons.download)),
            NavigationDestination(
                label: 'Bookmarks', icon: Icon(Icons.bookmark_outline)),
            NavigationDestination(label: 'History', icon: Icon(Icons.history)),
            NavigationDestination(
                label: 'Account', icon: Icon(Icons.person_rounded)),
          ],
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          }),
    );
  }
}
