import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_testing/image_picker_crop_compress/home_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ImageApp());
}
class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Need some Configuration  3 in ios and 1 in android(if Api>29)
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageHomeView(),
    );
  }
}
