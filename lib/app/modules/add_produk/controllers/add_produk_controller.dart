import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProdukController extends GetxController {
  // Text editing controllers untuk setiap input
  final productNameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  final descriptionController = TextEditingController();
  final productionDateController = TextEditingController();

  // Fungsi untuk menyimpan produk
  void saveProduct() {
    // Implementasikan logika penyimpanan
    if (productNameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        stockController.text.isNotEmpty) {
      // Simpan data atau kirim ke backend
      Get.snackbar("Success", "Product saved successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Please fill all required fields.",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
