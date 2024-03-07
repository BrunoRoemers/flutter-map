import 'package:flutter/material.dart';
import 'package:flutter_map/atoms/error_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../api/country.dart';
import '../atoms/marker_map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Country>> countries;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: countries,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorText(error: "failed to load countries");
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: MarkerMap(
              markers: {
                const Marker(
                  markerId: MarkerId('Brussels'),
                  position: LatLng(50.84678574085057, 4.35243753639113),
                )
              },
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();

    countries = fetchAllCountries();
  }
}
