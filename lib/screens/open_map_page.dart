import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:test_google_maps/notifiers/open_map_notifier.dart';

class OpenMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final openvm = Provider.of<OpenMapNotifier>(context);

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: openvm.kGoogle,
                zoom: 14.0,
                onTap: openvm.onTap,
              ),
              mapController: openvm.controller,
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      point: openvm.kGoogle,
                      builder: (_) => Tooltip(
                          message: openvm.kGoogle.latitude.toString() +
                              ", " +
                              openvm.kGoogle.longitude.toString(),
                          child: Icon(Icons.my_location_sharp)),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 30.0,
              right: 5.0,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.map),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: openvm.myLoc,
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
