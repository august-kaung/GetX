import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart'as p;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var fireImage;

  var imageSelectedPath = ''.obs;
  var imageSelectedSize = ''.obs;

  var imageCroppedPath = ''.obs;
  var imageCroppedSize = ''.obs;

  var imageCompressedPath=''.obs;
  var imageCompressedSize=''.obs;


  void getImage(ImageSource imageSource) async {
    final pickFile = await ImagePicker().pickImage(source: imageSource);
    if (pickFile != null) {
      imageSelectedPath.value = pickFile.path;
      imageSelectedSize.value =
          '${(File(imageSelectedPath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb';

      final croppedImageFile = await ImageCropper().cropImage(
          sourcePath: imageSelectedPath.value,
          maxHeight: 512,
          maxWidth: 512,
          compressFormat: ImageCompressFormat.jpg);
      imageCroppedPath.value = croppedImageFile!.path;
      imageCroppedSize.value =
          '${(File(imageCroppedPath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb';
      if(croppedImageFile==null){
        return;
      }
      // final dir = Directory.systemTemp;
      // final targetPath = '${dir.absolute.path}/temp.jpg';
      // var compressedXFile=await FlutterImageCompress.compressAndGetFile(
      //     imageCroppedPath.value,
      //     targetPath,
      //     quality: 90
      // );
      XFile resultFile=await compressImage(imageCroppedPath.value, 35);
      File compressedFile=File(resultFile.path);
      var fire;
      await uploadFile(compressedFile.path).then((data) {
        fire=data;
      });
      print('@@@@@@@@@@@@@$fire');
       imageSelectedPath.value=fire;

      // File compressedFile = File(compressedXFile!.path);
      // imageCompressedPath.value = compressedFile.path;
      // imageCompressedSize.value =
      // '${(File(imageCompressedPath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb';
      // uploadFile(compressedFile).then((value) => imageSelectedPath.value=value);

    } else {
      Get.snackbar('No image Is Found!', 'Please Select Image surely!');
    }
  }
  Future<XFile>compressImage(String path,int quality)async{
    final newPath=p.join((await getTemporaryDirectory()).path,'${DateTime.now()}.${p.extension(path)}');
    final result =await FlutterImageCompress.compressAndGetFile(path, newPath,quality: quality);
    return result!;
  }

  Future uploadFile(String file)async{
    final storage=FirebaseStorage.instance.ref().child('images').child(
        DateTime.now().toIso8601String() + p.basename(file));
    final result=await storage.putFile(File(file));
    final fileUrl=await result.ref.getDownloadURL();
    return fileUrl;
  }
}
