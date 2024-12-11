import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myproject/app/modules/add_produk/views/add_produk_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  
  const HomeAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Selamat datang!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 40,),
            onPressed: () {
              // Aksi untuk ikon akun
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search for products",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (value) {
                // Logika pencarian (opsional)
              },
            ),
          ),

          Expanded(
            child: Obx(() {
              return GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5 /4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.products[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Harga: -"),
                              const Text("Stok: -"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddProdukView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
