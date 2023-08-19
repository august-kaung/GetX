import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/animated_theme_switcher/constant/get_storage_key.dart';

import 'get_storage_key.dart';

class AppColors{
  var containerColor=GetStorage().read((GetStorageKey.IS_DARK_MODE))?
      Colors.white:Colors.black;
  var kPrimaryTextColor=GetStorage().read(GetStorageKey.IS_DARK_MODE)?
  Colors.white:Colors.black;
  var kSecondaryTextColor=GetStorage().read(GetStorageKey.IS_DARK_MODE)?
  Colors.redAccent:Colors.orange;
  var iconColor=Colors.black;
}