import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../atoms/marker_map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
