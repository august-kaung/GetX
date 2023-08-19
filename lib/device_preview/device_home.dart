import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceHomeView extends GetResponsiveView {
   DeviceHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Responsive Ui Testing'),
      ),
      body: Center(
        child: BuildResponsiveDesign(),
      ),
    );
  }
}
class BuildResponsiveDesign extends GetResponsiveView{
  BuildResponsiveDesign({super.key}):super(
    settings:const ResponsiveScreenSettings(
      desktopChangePoint: 800,
      tabletChangePoint: 700,
      watchChangePoint: 600
    )
  );
  @override
  Widget builder()  => Column(
      children: [
        const Text('width >=800  Desktop'),
        const Text('width >=700  Tablet'),
        const Text('width <=600  Watch'),
        const Text('width <700 and >600  Phone'),
        Text('Screen Type : ${screen.screenType.toString()}'),
        Text('Screen Width : ${screen.width.toString()}'),

      ],
    );
}
