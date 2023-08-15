import 'package:get/get.dart';
import 'package:getx_testing/internet_connectivity/network_controller.dart';

class NetworkBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }

}