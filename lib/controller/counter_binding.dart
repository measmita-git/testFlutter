import 'package:get/get.dart';

import '../modal/storage_services.dart';
import 'counter_controller.dart';


class CounterBinding implements Bindings {
  @override
  void dependencies() {
    // Register singleton services
    Get.lazyPut<StorageService>(() => StorageService());

    // Register controllers
    Get.lazyPut<CounterController>(() => CounterController());
  }
}