import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prayer_time_app/routing/scaffold_with_navigation.dart';
import 'package:prayer_time_app/screens/details_screen.dart';
import 'package:prayer_time_app/screens/home_screen.dart';

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final goRouter = GoRouter(
  initialLocation: '/a',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => const NoTransitionPage(
                child:
                    HomeScreen(label: 'Masjidlar', detailsPath: '/a/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Masjidlar'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                child:
                    HomeScreen(label: 'Sozlamalar', detailsPath: '/b/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Sozlamalar'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
