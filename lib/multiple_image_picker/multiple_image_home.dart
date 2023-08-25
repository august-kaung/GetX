import 'package:flutter/material.dart';
import 'package:getx_testing/multiple_image_picker/add_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultipleHomeScreen extends StatefulWidget {
  const MultipleHomeScreen({super.key});

  @override
  State<MultipleHomeScreen> createState() => _MultipleHomeScreenState();
}

class _MultipleHomeScreenState extends State<MultipleHomeScreen> {
  var returnData='empty';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  List<String>? prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),actions: [
        IconButton(onPressed: ()async{
          var preference=await SharedPreferences.getInstance();
          preference.setStringList('imgList', []);

        }, icon: const Icon(Icons.lock_reset))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          var result=await Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const AddImageScreen()));
          if(result=='fine'){
            print(result);
            setState(() {
              print('stated');
              setState(() {
                getPrefInstance();
              });
            });
          }
          },
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
          itemCount: prefs?.length??0,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context,index){
            return Container(
              child: Image.network(prefs?[index]??''),
            );
          }),
    );
  }

  getPrefInstance()async{
     var preference=await SharedPreferences.getInstance();
      prefs= preference.getStringList('imgList');

  }
}
