import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        height: 240,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
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
            ElevatedButton(
              onPressed: onGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textLight,
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenAdapter.setWidth(32),
                  vertical: ScreenAdapter.setHeight(16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
