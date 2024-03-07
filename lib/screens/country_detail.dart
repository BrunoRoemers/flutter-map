import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CountryDetail extends StatelessWidget {
  final String country;

  const CountryDetail({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Country: $country'),
          Center(
            child: ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                GoRouter.of(context).go('/');
              },
            ),
          )
        ],
      ),
    );
  }
}
