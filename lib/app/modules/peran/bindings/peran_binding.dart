import 'package:get/get.dart';

import '../controllers/peran_controller.dart';

class PeranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeranController>(
      () => PeranController(),
    );
  }
}
