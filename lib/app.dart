import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/country_detail.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Map',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
        // home: const Home(),
        home: const CountryDetail(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {}
