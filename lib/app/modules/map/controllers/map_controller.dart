// import 'package:get/get.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// class MapController extends GetxController {
//   final mapController = MapControllerWithUserPosition(); // Controller untuk OSM
//   Rx<String> destination = ''.obs; // Menyimpan tujuan
//   Rx<RoadInfo?> roadInfo = Rx<RoadInfo?>(null); // Menyimpan informasi rute

//   // Fungsi untuk mengubah tujuan
//   void setDestination(String newDestination) {
//     destination.value = newDestination;
//   }

//   // Fungsi untuk mengambil rute
//   Future<void> getRoute() async {
//     if (destination.value.isEmpty) {
//       Get.snackbar('Error', 'Masukkan tujuan terlebih dahulu');
//       return;
//     }

//     try {
//       // Contoh: Lokasi pengguna sebagai awal
//       GeoPoint userLocation = await mapController.myLocation();

//       // Tujuan (Anda perlu mengganti dengan konversi dari alamat ke koordinat)
//       GeoPoint destinationPoint = GeoPoint(
//         latitude: -6.200000, // Ganti dengan koordinat tujuan
//         longitude: 106.816666,
//       );

//       // Mendapatkan rute
//       final road = await mapController.drawRoad(
//         userLocation,
//         destinationPoint,
//         roadType: RoadType.car,
//         roadOption: RoadOption(
//           roadWidth: 10,
//           showMarkerOfPOI: false,
//           zoomInto: true,
//         ),
//       );

//       roadInfo.value = road;
//     } catch (e) {
//       Get.snackbar('Error', 'Gagal merencanakan rute: $e');
//     }
//   }

//   @override
//   void onClose() {
//     mapController.dispose(); // Pastikan controller dihapus saat tidak digunakan
//     super.onClose();
//   }
// }
