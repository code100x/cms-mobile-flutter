import 'package:cms_flutter/src/theme/dark_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cms_flutter/src/routing/router.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool darkMode = ref.watch(darkModeProvider);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      color: const Color(0xFF3B58E0),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
          navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: Color(0xFF111729),
          ),
          scaffoldBackgroundColor: const Color(0xFF020817),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF020817))),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
