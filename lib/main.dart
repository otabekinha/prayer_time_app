import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _mosquesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'mosquesNav');

void main() {
  runApp(NestedTabNavigationExampleApp());
}

class NestedTabNavigationExampleApp extends StatelessWidget {
  NestedTabNavigationExampleApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/mosques',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // Mosques tab with nested routes
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
          // Prayer Times tab
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/prayer_times',
                builder: (BuildContext context, GoRouterState state) =>
                    const PrayerTimesScreen(),
              ),
            ],
          ),
          // Settings tab
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'Mosques'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'Prayer Times'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
}

class MosquesScreen extends StatelessWidget {
  const MosquesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosques'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Mosque ${index + 1}'),
            onTap: () {
              GoRouter.of(context).go('/mosques/mosque/${index + 1}');
            },
          );
        },
      ),
    );
  }
}

class MosqueDetailScreen extends StatelessWidget {
  final String mosqueId;

  const MosqueDetailScreen({required this.mosqueId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mosque Details for $mosqueId'),
      ),
      body: Center(
        child: Text('Details for Mosque $mosqueId'),
      ),
    );
  }
}

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
      ),
      body: Center(
        child: Text('Prayer Times Content'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Content'),
      ),
    );
  }
}
