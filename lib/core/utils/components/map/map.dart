import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMap extends StatefulWidget {
  const CustomMap(
      {super.key,
      required this.center,
      required this.zoom,
      this.mapController,
      this.markers = const [], this.onTap});

  final LatLng center;
  final double zoom;
  final MapController? mapController;
  final List<CustomMapMarker> markers;
  final Function(TapPosition,LatLng)? onTap;

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
          center: widget.center,
          zoom: widget.zoom,
          onTap: widget.onTap
        ),
        mapController: widget.mapController,
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: widget.markers
                .map(
                  (marker) => Marker(
                    point: marker.latLng,
                    width: marker.width,
                    height: marker.height,
                    builder: (context) => marker.icon,
                  ),
                )
                .toList(),
          )
        ]);
  }
}

class CustomMapMarker {
  final double width;
  final double height;
  final Widget icon;
  final LatLng latLng;

  CustomMapMarker(
      {required this.width,
      required this.height,
      required this.icon,
      required this.latLng});
}
