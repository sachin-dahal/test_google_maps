import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeNotifier extends ChangeNotifier {
  Completer<GoogleMapController> _controller = Completer();
  final List<Marker> markers = [];
  bool isSatelliteView = false;
  MapType mapType = MapType.normal;

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
  }

  void goLoc() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(_kLoc.target));
    addMarker(_kLoc.target);
  }

  void onTap(LatLng coordinate) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(coordinate));
    addMarker(coordinate);
  }

  void addMarker(coordinate) {
    int id = 0;
    debugPrint(id.toString());
    markers.add(
      Marker(
        position: coordinate,
        markerId: MarkerId(id.toString()),
        infoWindow: InfoWindow(
          title: coordinate.latitude.toString() +
              ", " +
              coordinate.longitude.toString(),
        ),
      ),
    );
    notifyListeners();
  }

  MapType toggleMapType() {
    if (isSatelliteView) {
      return MapType.satellite;
    } else
      return MapType.normal;
  }

  void toggleView() {
    isSatelliteView = !isSatelliteView;
    notifyListeners();
  }
}
