import 'package:get/get.dart';

class PeranController extends GetxController {
  void selectRole(String role) {
    Get.snackbar('Peran Dipilih', 'Anda Memilih: $role', snackPosition: SnackPosition.BOTTOM);
  }
}
