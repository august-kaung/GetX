import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart'as p;
import 'package:shared_preferences/shared_preferences.dart';
class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  List<File> _image = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            uploadFile().whenComplete(() => Navigator.pop(context,'fine'));
          }, icon:const Icon(Icons.add))
        ],
        title: const Text('Add Image Screen'),
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, "Backbutton data");
          return Future(() => false);
        },
        child: GridView.builder(
            itemCount: _image.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return index == 0
                  ? Center(
                      child: IconButton(
                        onPressed: () {
                          chooseImage();
                        },
                        icon: const Icon(Icons.add),
                      ),
                    )
                  : SizedBox(
                      child: Image.file(_image[index - 1]),
                    );
            }),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile?.path ?? ''));
    });
    if (pickedFile == null) lostData();
  }

  Future lostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty)
      return;
    else if (response.file != null) {
      setState(() {
        _image.add(File(response.file?.path ?? ''));
      });
    } else {
      print('error');
    }
  }
  Future<List<String>> uploadFile()async{
    var preferences=await SharedPreferences.getInstance();
    List<String>fireImagesList=[];
    FirebaseStorage storage=FirebaseStorage.instance;
    for(var img in _image){
     var ref=storage.ref().child(p.basename(img.path));
      await ref.putFile(img).whenComplete(()async {
        await ref.getDownloadURL().then((value) {
          fireImagesList.add(value);
        });
      });
    }
    preferences.setStringList('imgList', fireImagesList);
    debugPrint(preferences.getStringList('imgList').toString());
    return fireImagesList;
  }
}
