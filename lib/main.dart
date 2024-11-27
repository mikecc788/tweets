import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home/home_view.dart';
import 'controllers/home_controller.dart';
import 'utils/screen_adapter.dart';
import 'utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 在构建 GetMaterialApp 之前初始化屏幕适配器
    ScreenAdapter.initialize();
    
    return GetMaterialApp(
      title: 'Web Designer Clone',
      theme: AppColors.lightTheme,
      darkTheme: AppColors.darkTheme,
      themeMode: ThemeMode.system, // 跟随系统主题
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
