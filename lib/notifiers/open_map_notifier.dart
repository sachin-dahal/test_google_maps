import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class OpenMapNotifier extends ChangeNotifier {
  
  final MapController controller = MapController();
  LatLng _kGoogle = LatLng(37.42796133580664, -122.085749655962);
  LatLng _kLoc = LatLng(26.706443, 87.292480);

  LatLng get kGoogle => _kGoogle;
  LatLng get kLoc => _kLoc;

  void onTap(coordinate) {
    _kGoogle = coordinate;
    controller.move(coordinate, 14);
    notifyListeners();
  }

  getLoc() {}

  void myLoc() {
    controller.move(kLoc, 14);
    _kGoogle = _kLoc;
    notifyListeners();
  }
}
