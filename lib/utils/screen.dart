import 'dart:ui';

import 'package:flutter/cupertino.dart';

MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
double screenWidth = mediaQuery.size.width; //屏幕宽度
var h = mediaQuery.size.height; //屏幕高度
var scale = mediaQuery.devicePixelRatio; //每一个逻辑像素包含多少个原始像素
var statusBar = mediaQuery.padding.top; //状态栏高度

class Screen {
  px(double val) {
    double screenScale = screenWidth / 375;
    return val * screenScale;
  }

  pxFont(val) {}
}

double px(double val) {
  // double screenScale = screenWidth / 375;
  return val * 1;
}

var screen = Screen();
