import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppState extends ChangeNotifier {
  List<Marker> markers = [];
  int markerNum = 0;


  void addMarker(LatLng position) {

    markers.add(
      Marker(
        markerId: MarkerId((DateTime.now().millisecondsSinceEpoch).toString()),
        position: position,
        infoWindow: InfoWindow(
          title: "Marker: ${++markerNum}",
        ),
      ),
    );
    notifyListeners();
  }

  void removeMarker(Marker marker) {
    markers.remove(marker);
    notifyListeners();
  }

  String generateLatLng() {
    final _random = Random();
    double randomNumber = _random.nextDouble() * (90 - (-90)) + (-90);
    return randomNumber.toString();
  }
}
