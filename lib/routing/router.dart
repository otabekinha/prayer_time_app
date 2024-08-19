import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prayer_time_app/screens/mosques_screen.dart';
import 'package:prayer_time_app/screens/prayer_times_screen.dart';
import 'package:prayer_time_app/screens/scaffold_with_nav_bar.dart';
import 'package:prayer_time_app/screens/settings_screen.dart';

import '../screens/mosque_detail_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _mosquesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'mosquesNav');

GoRouter createRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/mosques',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _mosquesNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/mosques',
                builder: (BuildContext context, GoRouterState state) =>
                    const MosquesScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'mosque/:id',
                    builder: (BuildContext context, GoRouterState state) =>
                        MosqueDetailScreen(
                      mosqueId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/prayer_times',
                builder: (BuildContext context, GoRouterState state) =>
                    const PrayerTimesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/settings',
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
