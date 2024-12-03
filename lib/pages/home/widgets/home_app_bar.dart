import 'package:flutter/material.dart';
import '../../../utils/screen_adapter.dart';
import '../../../utils/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  final Function(int) onNavItemTap;

  const HomeAppBar({
    Key? key,
    required this.onNavItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background,
      elevation: 0.5,
      shadowColor: AppColors.border,
      title: Row(
        children: [
          _buildLogo(),
          _buildNavigationItems(),
        ],
      ),
    );
  }

  /// 构建Logo
  Widget _buildLogo() {
    return Text(
      'Web Designer',
      style: TextStyle(
        fontSize: ScreenAdapter.fontSize(32),
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
    );
  }

  /// 构建导航栏项目
  Widget _buildNavigationItems() {
    return Row(
      children: [
        _buildNavItem('Features', 0),
        SizedBox(width: ScreenAdapter.setWidth(24)),
        _buildNavItem('Examples', 1),
        SizedBox(width: ScreenAdapter.setWidth(24)),
        _buildNavItem('Resources', 2),
      ],
    );
  }

  /// 构建导航项
  Widget _buildNavItem(String text, int index) {
    return InkWell(
      onTap: () => onNavItemTap(index),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(16),
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
