import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/peran_controller.dart';

class PeranView extends GetView<PeranController> {
  const PeranView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent, // Membuat background Scaffold transparan
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(screenW * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenH * 0.05),
                  const Text(
                    'Pilih Peran yang Sesuai\nuntuk Melanjutkan',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenH * 0.25),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _role(
                          context,
                          title: 'Pengunjung',
                          iconRole: Icons.person,
                          color: Colors.blue,
                        ),
                        _role(
                          context,
                          title: 'Pelaku UMKM',
                          iconRole: Icons.store,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _role(BuildContext context, {required String title, required IconData iconRole, required Color color}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => controller.selectRole(title),
      child: MouseRegion(
        onEnter: (_) {
          // Menangani efek ketika mouse memasuki area container (hover)
        },
        onExit: (_) {
          // Menangani efek ketika mouse keluar dari area container
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // Durasi animasi
          width: screenWidth * 0.35,
          height: screenWidth * 0.35,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              controller.selectRole(title); // Panggil fungsi saat container di-tap
            },
            splashColor: color.withOpacity(0.2), // Warna efek splash pada saat tap
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconRole, size: screenWidth * 0.1, color: color),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Ukuran teks responsif
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
