import 'package:flutter/material.dart';
import 'package:tweets/utils/gaps.dart';
import 'package:tweets/widgets/circle_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/screen_adapter.dart';

class TopContent extends StatelessWidget {
  final VoidCallback onStartBuilding;
  final VoidCallback onResources;

  const TopContent({
    Key? key,
    required this.onStartBuilding,
    required this.onResources,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenAdapter.setWidth(80),
        vertical: ScreenAdapter.setHeight(100),
      ),
      decoration: BoxDecoration(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Powerful for developers.',
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(48),
              fontWeight: FontWeight.w800,
              color: AppColors.textLight,
              height: 1.2,
            ),
          ),
          SizedBox(height: ScreenAdapter.setHeight(16)),
          Text(
            'Fast for everyone.',
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(48),
              fontWeight: FontWeight.w800,
              color: AppColors.textLight,
              height: 1.2,
            ),
          ),
          SizedBox(height: ScreenAdapter.setHeight(24)),
          Text(
            'Bring blockchain to the people. Fast supports experiences\nfor power users, new consumers, and everyone in between.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(18),
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          SizedBox(height: ScreenAdapter.setHeight(40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButton(
                text: 'BUILDING',
                border: true,
              ),
              Gaps.h24,
              CircleButton(text: 'RESOURCES', border: true),
            ],
          ),
          SizedBox(height: ScreenAdapter.setHeight(40)),
          Text(
            'Powering tools and integrations from companies all around the world',
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(22),
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
