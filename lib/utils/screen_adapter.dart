import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAdapter {
  // 设计稿的尺寸
  static const double designWidth = 1920.0; // 网页端设计稿宽度
  static const double designHeight = 1080.0; // 网页端设计稿高度
  
  // 获取屏幕宽度
  static double get screenWidth => Get.width;
  
  // 获取屏幕高度
  static double get screenHeight => Get.height;
  
  // 获取缩放比例
  static double get scaleWidth => screenWidth / designWidth;
  static double get scaleHeight => screenHeight / designHeight;
  
  // 获取适配后的尺寸
  static double setWidth(double width) => width * scaleWidth;
  static double setHeight(double height) => height * scaleHeight;
  
  // 字体大小适配方法
  static double fontSize(double size) {
    // 获取当前设备的像素密度
    final double pixelRatio = Get.pixelRatio;
    
    // 判断是否是移动设备
    bool isMobile = GetPlatform.isMobile;
    
    if (isMobile) {
      // 移动端字体大小计算
      return (size * scaleWidth).clamp(12.0, size);
    } else {
      // 网页端字体大小计算
      double scaleFactor = (screenWidth / designWidth).clamp(0.8, 1.2);
      return size * scaleFactor;
    }
  }
  
  // 获取状态栏高度
  static double get statusBarHeight => Get.statusBarHeight;
  
  // 获取底部安全区域高度
  static double get bottomBarHeight => Get.bottomBarHeight;
  
  // 初始化方法，在应用启动时调用
  static void initialize() {
    // 使用 MediaQuery 设置文本缩放因子
    Get.put(MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first));
  }
}
