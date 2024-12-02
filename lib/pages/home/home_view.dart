import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweets/pages/home/widgets/building_section.dart';
import 'package:tweets/pages/home/widgets/top_content.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/home_controller.dart';
import '../../utils/screen_adapter.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common_footer.dart';
import 'widgets/company_carousel.dart';
import 'widgets/feature_grid.dart';
import 'widgets/statistics_carousel.dart';

/// 首页视图
/// 展示网页设计工具的主要功能和特点
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
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
            SizedBox(height: ScreenAdapter.setHeight(40)),
            TopContent(onStartBuilding: () {}, onResources: () {}),
            CompanyCarousel(),
            SizedBox(height: ScreenAdapter.setHeight(100)),
            const StatisticsCarousel(),
            SizedBox(height: ScreenAdapter.setHeight(24)),
            FeatureGrid(),
            SizedBox(height: ScreenAdapter.setHeight(40)),
            BuildingSection(
              onGetStarted: () {
                // Add your desired action when "Get Started" is clicked
                _launchUrl('https://www.wix.com/website/builder');
              },
            ),
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
      'Create Beautiful Websites',
      style: TextStyle(
        fontSize: ScreenAdapter.fontSize(48),
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.2,
      ),
    );
  }

  /// 构建副标题文本
  Widget _buildSubtitle() {
    return Text(
      'Design and launch your website with our intuitive tools',
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
    );
  }

  /// 构建导航项
  Widget _buildNavItem(String title, int index) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.setWidth(16),
          vertical: ScreenAdapter.setHeight(8),
        ),
        backgroundColor: Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(16),
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
