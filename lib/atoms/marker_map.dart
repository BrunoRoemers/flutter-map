import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerMap extends StatefulWidget {
  const MarkerMap({super.key});

  @override
  State<MarkerMap> createState() => _MarkerMapState();
}

class _MarkerMapState extends State<MarkerMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(50.84678574085057, 4.35243753639113);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 5.0));
  }
}
