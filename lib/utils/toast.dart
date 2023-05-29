import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String val) {
  Fluttertoast.showToast(
      msg: val,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Color.fromRGBO(0, 0, 0, .6),
      textColor: Colors.white,
      fontSize: 16.0);
}

void toastCancel() {
  Fluttertoast.cancel();
}
