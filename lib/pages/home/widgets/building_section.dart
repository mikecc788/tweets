import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweets/widgets/circle_button.dart';
import '../../../utils/screen_adapter.dart';
import '../../../utils/app_colors.dart';

class BuildingSection extends StatelessWidget {
  final VoidCallback onGetStarted;

  const BuildingSection({
    Key? key,
    required this.onGetStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(60)),
      child: Container(
        width: ScreenAdapter.screenWidth,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF382054),
              const Color(0xFF121212),
              const Color(0xFF19141E),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: ScreenAdapter.setHeight(40)),
            Text(
              'Design and launch your website with our intuitive tools',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(20),
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            SizedBox(height: ScreenAdapter.setHeight(40)),
            CircleButton(
                text: 'Learn more', onPressed: () => Get.toNamed('/about')),
          ],
        ),
      ),
    );
  }
}
