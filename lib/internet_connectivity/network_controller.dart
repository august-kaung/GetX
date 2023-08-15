import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var networkStatus = 0.obs;
  Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _streamSubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateConnectionStatus(result);
  }

  updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        networkStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        networkStatus.value = 2;
        break;
      case ConnectivityResult.none:
        networkStatus.value = 0;
        break;
      default:
        Get.snackbar('Network Error', 'Please Connect Network');
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
