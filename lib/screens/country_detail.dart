import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  final String country;

  const CountryDetail({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            print('pressed $country');
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
