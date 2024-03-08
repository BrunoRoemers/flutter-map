import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'screens/country_detail.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: Home(),
            );
          },
          routes: [
            GoRoute(
              path: 'country/:name',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: CountryDetail(
                    country: state.pathParameters['name']!,
                    capital: state.uri.queryParameters['capital'] ?? '?',
                  ),
                );
              },
            ),
          ]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        title: 'Flutter Map',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
        routerConfig: _router,
      ),
    );
  }
}

class AppState extends ChangeNotifier {}
