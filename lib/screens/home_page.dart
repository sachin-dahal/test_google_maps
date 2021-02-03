import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_google_maps/notifiers/home_notifier.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homevm = Provider.of<HomeNotifier>(context);

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: homevm.kGoogle,
              mapType: homevm.toggleMapType(),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: homevm.onMapCreated,
              markers: homevm.markers.toSet(),
              mapToolbarEnabled: true,
              onTap: homevm.onTap,
            ),
            Positioned(
              top: 30.0,
              right: 5.0,
              child: FloatingActionButton(
                onPressed: homevm.toggleView,
                child: Icon(Icons.map),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: homevm.goLoc,
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
