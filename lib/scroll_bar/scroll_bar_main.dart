import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const ScrollBarMyApp());
}
class ScrollBarMyApp extends StatelessWidget {
  const ScrollBarMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutoCompleteWidget(),
    );
  }}
class AutoCompleteWidget extends StatelessWidget {
   AutoCompleteWidget({super.key});
  final List<String>data=['apple','banana','melon'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
      ),
      body: SafeArea(
        child: Autocomplete<String>(

          optionsBuilder: (TextEditingValue value){
            if(value.text==''){
              return const Iterable<String>.empty();
            }
            return data.where((element) {
              return element.contains(value.text.toLowerCase());
            });
          },
          onSelected: (String val){
            print(val.toString());
          },
        ),
      ),
    );
  }
}




// class ScrollBarHomeScreen extends StatelessWidget {
//    ScrollBarHomeScreen({super.key});
//   final ScrollController controller=ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title:const Text('Form Validation'),
//       ),
//       body: RawScrollbar(
//
//         thumbVisibility: true,
//         thumbColor: Colors.red,
//         controller: controller,
//         thickness: 20,
//         child: ListView.builder(
//           controller: controller,
//             itemCount: 30,
//             itemBuilder: (context,index){
//           return Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: Container(
//               width: context.width,
//               height: 50,
//               color: Colors.green,
//             ),
//           );
//         }),
//       ),
//     );
//   }
 //}
