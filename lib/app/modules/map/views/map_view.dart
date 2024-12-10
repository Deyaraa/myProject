import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class MapView extends StatelessWidget {
  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rute Perjalanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => mapController.clearRoute(),
          ),
        ],
      ),
      body: Obx(() {
        if (mapController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            GoogleMap(
              onMapCreated: (controller) =>
                  mapController.googleMapController = controller,
              initialCameraPosition: CameraPosition(
                target: mapController.userLocation.value,
                zoom: 12,
              ),
              markers: {
                ...mapController.destinations.map((destination) {
                  return Marker(
                    markerId: MarkerId(destination.toString()),
                    position: destination,
                    infoWindow: InfoWindow(
                      title: 'Destinasi',
                      snippet: destination.toString(),
                    ),
                    onTap: () => mapController.addToRoute(destination),
                  );
                }).toSet(),
                Marker(
                  markerId: const MarkerId('userLocation'),
                  position: mapController.userLocation.value,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  infoWindow: const InfoWindow(title: 'Lokasi Anda'),
                ),
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: [mapController.userLocation.value]
                      .followedBy(mapController.selectedRoute)
                      .toList(),
                  color: Colors.blue,
                  width: 4,
                ),
              },
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk rute efisien bisa ditambahkan di sini
                  Get.snackbar('Rute', 'Menampilkan rute sesuai pilihan Anda.');
                },
                child: const Text('Hitung Rute'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
