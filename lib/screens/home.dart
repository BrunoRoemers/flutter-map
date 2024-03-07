import 'package:flutter/material.dart';

import '../atoms/marker_map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MarkerMap(),
    );
  }
}
