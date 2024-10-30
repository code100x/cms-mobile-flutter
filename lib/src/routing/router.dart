import 'package:cms_flutter/src/features/account/presentation/account_screen.dart';
import 'package:cms_flutter/src/features/account/presentation/change_password_screen.dart';
import 'package:cms_flutter/src/features/account/presentation/edit_profile_screen.dart';
import 'package:cms_flutter/src/features/auth/data/auth_notifier.dart';

import 'package:cms_flutter/src/features/auth/presentation/signin_screen.dart';
import 'package:cms_flutter/src/features/auth/presentation/signup_screen.dart';
import 'package:cms_flutter/src/features/auth/presentation/verify_otp_screen.dart';
import 'package:cms_flutter/src/features/bookmarks/presentation/bookmarks_screen.dart';
import 'package:cms_flutter/src/features/courses/presentation/course_week_screen.dart';
import 'package:cms_flutter/src/features/courses/presentation/courses_screen.dart';
import 'package:cms_flutter/src/features/courses/presentation/single_course_screen.dart';
import 'package:cms_flutter/src/features/courses/video_player/presentation/video_player_screen.dart';
import 'package:cms_flutter/src/features/downloads/presentation/downloads_screen.dart';
import 'package:cms_flutter/src/features/history/presentation/history_screen.dart';
import 'package:cms_flutter/src/features/landing/presentation/landing_screen.dart';
import 'package:cms_flutter/src/routing/scaffold_with_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _coursesShellKey = GlobalKey<NavigatorState>(debugLabel: 'coursesShell');
final _downloadsShellKey =
    GlobalKey<NavigatorState>(debugLabel: 'downloadsShell');
final _bookmarksShellKey =
    GlobalKey<NavigatorState>(debugLabel: 'bookmarksShell');
final _historyShellKey = GlobalKey<NavigatorState>(debugLabel: 'historyShell');
final _accountShellKey = GlobalKey<NavigatorState>(debugLabel: 'accountShell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.watch(authNotifierProvider);
  return GoRouter(
    initialLocation: '/courses',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isAuthenticated = authNotifier.isAuthenticated;
      print("checked if is authenticated $isAuthenticated");
      final loggedInRequiredPaths = [
        '/courses',
        '/downloads',
        '/bookmarks',
        '/history',
        '/account',
      ];
      final guestOnlyPaths = ['/signin', '/signup', '/verify-otp'];

      if (!isAuthenticated && loggedInRequiredPaths.contains(state.uri.path)) {
        return '/landing';
      } else if (isAuthenticated && guestOnlyPaths.contains(state.uri.path)) {
        return '/courses';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/landing',
        name: 'landing',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LandingScreen()),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SignupScreen()),
      ),
      GoRoute(
        path: '/signin',
        name: 'signin',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SigninScreen()),
      ),
      GoRoute(
        path: '/verify-otp',
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(navigatorKey: _coursesShellKey, routes: [
            GoRoute(
                path: '/courses',
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: CoursesScreen(),
                    ),
                routes: [
                  GoRoute(
                      path: ':courseId',
                      builder: (context, state) => const SingleCourseScreen(),
                      routes: [
                        GoRoute(
                            path: ':courseWeek',
                            builder: (context, state) =>
                                const CourseWeekScreen(),
                            routes: [
                              GoRoute(
                                path: ':videoId',
                                builder: (context, state) =>
                                    const VideoPlayerScreen(),
                              )
                            ])
                      ])
                ])
          ]),
          StatefulShellBranch(navigatorKey: _downloadsShellKey, routes: [
            GoRoute(
              path: '/downloads',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: DownloadsScreen()),
            )
          ]),
          StatefulShellBranch(navigatorKey: _bookmarksShellKey, routes: [
            GoRoute(
              path: '/bookmarks',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: BookmarksScreen(),
              ),
            )
          ]),
          StatefulShellBranch(navigatorKey: _historyShellKey, routes: [
            GoRoute(
              path: '/history',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HistoryScreen()),
            )
          ]),
          StatefulShellBranch(navigatorKey: _accountShellKey, routes: [
            GoRoute(
                path: '/account',
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: AccountScreen(),
                    ),
                routes: [
                  GoRoute(
                    path: 'profile',
                    builder: (context, state) => const EditProfileScreeen(),
                  ),
                  GoRoute(
                    path: 'change-password',
                    builder: (context, state) => const ChangePasswordScreen(),
                  )
                ])
          ]),
        ],
      )
    ],
  );
});
