import 'package:cms_flutter/src/constants/colors.dart';
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
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            outline: const Color(0xFFE2E8F0),
            tertiary: const Color(0xFFF1F5F9),
            onTertiary: const Color(0xFF020817),
          ),
          iconTheme: const IconThemeData(),
          iconButtonTheme: const IconButtonThemeData(),
          navigationRailTheme: const NavigationRailThemeData(
              indicatorColor: Colors.grey, backgroundColor: Color(0xFFF1F5F9)),
          navigationBarTheme: const NavigationBarThemeData(
            indicatorColor: Colors.grey,
            backgroundColor: Color(0xFFF1F5F9),
          ),
          scaffoldBackgroundColor: LightPallete.bg,
          appBarTheme: const AppBarTheme(backgroundColor: LightPallete.bg)),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
          primaryColor: const Color(0xFF3B59E8),
          colorScheme: const ColorScheme.dark().copyWith(
            onTertiary: const Color(0xFFF8FAFC),
            outline: const Color(0xFF1E293B),
            tertiary: const Color(0xFF0F172A),
          ),
          iconTheme: const IconThemeData(),
          iconButtonTheme: const IconButtonThemeData(),
          navigationRailTheme: const NavigationRailThemeData(
            indicatorColor: Colors.white,
            backgroundColor: Color(0xFF0F172A),
          ),
          navigationBarTheme: const NavigationBarThemeData(
            indicatorColor: Colors.white,
            backgroundColor: Color(0xFF0F172A),
          ),
          scaffoldBackgroundColor: DarkPallete.bg,
          appBarTheme: const AppBarTheme(backgroundColor: DarkPallete.bg)),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
