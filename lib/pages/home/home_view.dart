import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/home_controller.dart';
import '../../utils/screen_adapter.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common_footer.dart';

/// 首页视图
/// 展示网页设计工具的主要功能和特点
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildMainContent(),
          _buildMainContent(),
          _buildMainContent(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: CommonFooter(
              onAboutUs: () =>
                  _launchUrl('https://www.wix.com/blog/web-design'),
              onContactUs: () =>
                  _launchUrl('https://www.wix.com/blog/web-design'),
              onPrivacyPolicy: () =>
                  _launchUrl('https://www.wix.com/blog/web-design'),
              onTerms: () => _launchUrl('https://www.wix.com/blog/web-design'),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建应用栏
  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background,
      elevation: 0,
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
        fontWeight: FontWeight.w900,
        color: AppColors.primary,
      ),
    );
  }

  /// 构建导航栏项目
  Widget _buildNavigationItems() {
    return Row(
      children: [
        _buildNavItem('Features', 0),
        _buildNavItem('Examples', 1),
        _buildNavItem('Resources', 2),
      ],
    );
  }

  /// 构建主要内容区域
  Widget _buildMainContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.setWidth(80),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenAdapter.setHeight(100)),
            _buildHeadline(),
            SizedBox(height: ScreenAdapter.setHeight(24)),
            _buildSubtitle(),
            SizedBox(height: ScreenAdapter.setHeight(40)),
            _buildGetStartedButton(),
          ],
        ),
      ),
    );
  }

  /// 构建标题文本
  Widget _buildHeadline() {
    return Text(
      'Create engaging\nHTML5 banners',
      style: TextStyle(
        fontSize: ScreenAdapter.fontSize(64),
        fontWeight: FontWeight.w900,
        color: AppColors.textPrimary,
        height: 1.1,
      ),
    );
  }

  /// 构建副标题文本
  Widget _buildSubtitle() {
    return Text(
      'Design beautiful and interactive display ads that work seamlessly across devices.',
      style: TextStyle(
        fontSize: ScreenAdapter.fontSize(20),
        color: AppColors.textSecondary,
        height: 1.5,
      ),
    );
  }

  /// 构建开始按钮
  Widget _buildGetStartedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.setWidth(32),
          vertical: ScreenAdapter.setHeight(20),
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        'Get started',
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(18),
          fontWeight: FontWeight.w500,
          color: AppColors.textLight,
        ),
      ),
    );
  }

  /// 构建导航项
  Widget _buildNavItem(String text, int index) {
    return Obx(() {
      final isSelected = controller.selectedIndex.value == index;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => controller.setHovered(true),
        onExit: (_) => controller.setHovered(false),
        child: GestureDetector(
          onTap: () => controller.setSelectedIndex(index),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenAdapter.setWidth(12),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenAdapter.setWidth(24),
              vertical: ScreenAdapter.setHeight(12),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontSize: ScreenAdapter.fontSize(24),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    });
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
