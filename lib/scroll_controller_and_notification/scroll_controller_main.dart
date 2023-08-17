import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_testing/scroll_controller_and_notification/scroll_controller_home_view.dart';

void main(){
  runApp(const ScrollControllerMyApp());
}
class ScrollControllerMyApp extends StatelessWidget {
  const ScrollControllerMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:ScrollControllerHomeView()
    );
  }
}
