import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast ({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red[400],
      textColor: Colors.white,
      fontSize: 20.0,
  );
}