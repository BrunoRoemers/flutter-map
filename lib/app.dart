import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';

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
        home: const Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}

class AppState extends ChangeNotifier {}
