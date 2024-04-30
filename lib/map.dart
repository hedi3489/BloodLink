import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.5019, -73.5674);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red[700],
      appBar: AppBar(
        title: Text('Find a Clinic', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
              width: 300,
              height: 300,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(target: _center, zoom: 12.0),
                markers: {
                  const Marker(
                      markerId: MarkerId('Clinic 1'),
                      position: LatLng(45.5077, -73.5509)),
                  const Marker(
                      markerId: MarkerId('Clinic 2'),
                      position: LatLng(45.4985, -73.5794)),
                  const Marker(
                      markerId: MarkerId('Clinic 3'),
                      position: LatLng(45.5016, -73.5932)),
                  const Marker(
                      markerId: MarkerId('Clinic 4'),
                      position: LatLng(45.5273, -73.5704)),
                },
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
