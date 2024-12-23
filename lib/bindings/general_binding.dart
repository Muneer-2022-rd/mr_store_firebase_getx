import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
