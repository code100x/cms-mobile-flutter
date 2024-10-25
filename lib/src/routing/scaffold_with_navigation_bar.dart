import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      } else {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
    });
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
              label: 'My Courses',
              icon: Icon(Icons.play_circle_outline_outlined)),
          NavigationDestination(label: 'Downloads', icon: Icon(Icons.download)),
          NavigationDestination(
              label: 'Bookmarks', icon: Icon(Icons.bookmark_outline)),
          NavigationDestination(label: 'History', icon: Icon(Icons.history)),
          NavigationDestination(
              label: 'Account', icon: Icon(Icons.person_rounded)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  label: Text('My Courses'),
                  icon: Icon(Icons.play_circle_outline_outlined)),
              NavigationRailDestination(
                  label: Text('Downloads'), icon: Icon(Icons.download)),
              NavigationRailDestination(
                  label: Text('Bookmarks'), icon: Icon(Icons.bookmark_outline)),
              NavigationRailDestination(
                  label: Text('History'), icon: Icon(Icons.history)),
              NavigationRailDestination(
                  label: Text('Account'), icon: Icon(Icons.person_rounded)),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
            color: Theme.of(context).colorScheme.outline,
          ),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
