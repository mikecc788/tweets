import 'package:flutter/material.dart';
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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF000000),
            const Color(0xFF1A1A1A),
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
            'Bring blockchain to the people. Solana supports experiences\nfor power users, new consumers, and everyone in between.',
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
              _buildButton(
                'START BUILDING',
                AppColors.primary,
                onStartBuilding,
              ),
              SizedBox(width: ScreenAdapter.setWidth(16)),
              _buildButton(
                'RESOURCES',
                Colors.transparent,
                onResources,
                border: true,
              ),
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

  Widget _buildButton(
    String text,
    Color backgroundColor,
    VoidCallback onPressed, {
    bool border = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.textLight,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.setWidth(32),
          vertical: ScreenAdapter.setHeight(16),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: border
              ? BorderSide(color: AppColors.textLight, width: 1)
              : BorderSide.none,
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(16),
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
