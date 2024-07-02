import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

customToast({
  required String title,
  required Color color
})
{
  Fluttertoast.showToast(
      msg: title,
      textColor: ColorManager.primary,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
  );

}
