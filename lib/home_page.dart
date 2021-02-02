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
        child: GoogleMap(
          initialCameraPosition: homevm.kGoogle,
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: homevm.onMapCreated,
          markers: homevm.markers.toSet(),
          mapToolbarEnabled: true,
          onTap: homevm.onTap,
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: homevm.goLake,
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
