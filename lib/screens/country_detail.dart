import 'package:flutter/material.dart';
import 'package:flutter_map/api/stereotypes.dart';
import 'package:go_router/go_router.dart';

import '../atoms/error_text.dart';

class CountryDetail extends StatefulWidget {
  final String country;

  const CountryDetail({
    super.key,
    required this.country,
  });

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  late Future<Stereotypes> stereotypes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: stereotypes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const ErrorText(error: "failed to load stereotypes");
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Country: ${widget.country}'),
              Text('Capital: TODO'),
              const SizedBox(height: 30),
              Container(
                  padding: const EdgeInsets.all(30),
                  color: Theme.of(context).primaryColorLight,
                  child: Text(snapshot.data!.content)),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  child: const Text('Back'),
                  onPressed: () {
                    GoRouter.of(context).go('/');
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  @override
  void initState() {
    super.initState();

    stereotypes = fetchStereotypes(widget.country);
  }
}
