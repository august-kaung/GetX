import 'package:get/get.dart';
import 'package:getx_testing/reactive_statemanagement/student_class.dart';

class MyController extends GetxController{
  final studentObj=Student(name: 'kaunghtet').obs;
  void changeUpperCase(){
    studentObj.update((val) {
      val!.name=val.name.toString().toUpperCase();
    });
  }
  var count=0;
  void increment(){
    count++;
    update(['one']);
  }
  void decrement(){
    count--;
    update(['two']);
  }
  @override
  void onClose() {
    super.onClose();
  }
}
