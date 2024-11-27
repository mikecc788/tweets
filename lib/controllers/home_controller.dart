import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isHovered = false.obs;
  final RxInt selectedIndex = (-1).obs;

  void setHovered(bool value) {
    isHovered.value = value;
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
