import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_produk_controller.dart';

class AddProdukView extends StatelessWidget {
  final AddProdukController controller = Get.put(AddProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TAMBAH DATA"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please fill in the form below correctly.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Nama Produk
              TextField(
                controller: controller.productNameController,
                decoration: const InputDecoration(
                  labelText: "Nama Produk",
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Kategori
              TextField(
                controller: controller.categoryController,
                readOnly: true,
                onTap: () {
                  // Logika untuk memilih kategori
                },
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  prefixIcon: Icon(Icons.category),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Upload Image
              TextField(
                readOnly: true,
                onTap: () {
                  // Logika untuk upload gambar
                },
                decoration: const InputDecoration(
                  labelText: "Upload Image",
                  prefixIcon: Icon(Icons.upload),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Harga
              TextField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Harga",
                  prefixText: "Rp. ",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Stok
              TextField(
                controller: controller.stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Stok",
                  prefixIcon: Icon(Icons.add),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Deskripsi
              TextField(
                controller: controller.descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Tanggal Produksi
              TextField(
                controller: controller.productionDateController,
                readOnly: true,
                onTap: () {
                  // Logika untuk memilih tanggal
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      controller.productionDateController.text =
                          selectedDate.toString().split(' ')[0];
                    }
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Tanggal Produksi",
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.saveProduct,
                  child: const Text("SIMPAN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
