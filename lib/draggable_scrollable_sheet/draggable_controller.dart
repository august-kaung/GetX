import 'package:get/get.dart';

class DraggableController extends GetxController{
  List<bool>selected=List.generate(30, (index) => false).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}