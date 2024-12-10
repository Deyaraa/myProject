import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  var isLoading = true.obs;
  var userLocation = const LatLng(0, 0).obs; // Lokasi pengguna
  var selectedRoute = <LatLng>[].obs; // Rute yang dipilih
  late GoogleMapController googleMapController;

  // Daftar tujuan
  var destinations = [
    LatLng(-6.2088, 106.8456), // Contoh: Jakarta
    LatLng(-6.9175, 107.6191), // Contoh: Bandung
    LatLng(-7.2575, 112.7521), // Contoh: Surabaya
  ];

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();
  }

  // Mendapatkan lokasi pengguna
  Future<void> _getUserLocation() async {
    Location location = Location();

    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    final locData = await location.getLocation();
    userLocation.value = LatLng(locData.latitude!, locData.longitude!);
    isLoading.value = false;
  }

  // Menambahkan tujuan ke rute
  void addToRoute(LatLng destination) {
    if (!selectedRoute.contains(destination)) {
      selectedRoute.add(destination);
    }
  }

  // Menghapus tujuan dari rute
  void removeFromRoute(LatLng destination) {
    selectedRoute.remove(destination);
  }

  // Membersihkan rute
  void clearRoute() {
    selectedRoute.clear();
  }
}
