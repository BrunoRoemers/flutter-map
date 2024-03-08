import 'package:flutter/material.dart';
import 'package:flutter_map/atoms/error_text.dart';
import 'package:go_router/go_router.dart';
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
    return Scaffold(
      body: FutureBuilder(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const ErrorText(error: "failed to load countries");
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final markers = snapshot.data!.where((country) {
              if (country.capital.isEmpty) {
                print('No capital for ${country.name.common}');
                return false;
              }

              if (country.capitalInfo.latlng.isEmpty) {
                print('No latlng for ${country.name.common}');
                return false;
              }

              return true;
            }).map((country) {
              return Marker(
                markerId: MarkerId(
                    "${country.capital.first} (${country.name.common})"),
                position: LatLng(
                  country.capitalInfo.latlng[0],
                  country.capitalInfo.latlng[1],
                ),
                onTap: () {
                  GoRouter.of(context).go(
                    '/country/${country.name.common}?capital=${country.capital.first}',
                  );
                },
              );
            }).toSet();

            return Center(
              child: MarkerMap(
                markers: markers,
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    countries = fetchAllCountries();
  }
}
