import 'package:get/get.dart';

import '../controllers/denda_controller.dart';

class PeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DendaController>(
      () => DendaController(),
    );
  }
}
