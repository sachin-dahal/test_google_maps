import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeNotifier extends ChangeNotifier {
  Completer<GoogleMapController> _controller = Completer();
  final List<Marker> markers = [];

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 15.0,
    tilt: 10,
  );

  final CameraPosition _kLoc = CameraPosition(
    target: LatLng(26.706443, 87.292480),
    zoom: 15.0,
  );

  CameraPosition get kGoogle => _kGooglePlex;
  CameraPosition get kLoc => _kLoc;

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    addMarker(_kGooglePlex.target);
    notifyListeners();
  }

  void goLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(_kLoc.target));
    addMarker(_kLoc.target);
  }

  void onTap(LatLng coordinate) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(coordinate));
    addMarker(coordinate);
    notifyListeners();
  }

  void addMarker(coordinate) {
    int id = 1;
    debugPrint(id.toString());
    markers
        .add(Marker(position: coordinate, markerId: MarkerId(id.toString())));
    notifyListeners();
  }
}