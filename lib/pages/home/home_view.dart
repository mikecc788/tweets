import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweets/pages/home/widgets/aboutus_item.dart';
import 'package:tweets/pages/home/widgets/building_section.dart';
import 'package:tweets/pages/home/widgets/support_item.dart';
import 'package:tweets/pages/home/widgets/top_content.dart';
import 'package:tweets/utils/gaps.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/home_controller.dart';
import '../../utils/log.dart';
import '../../utils/screen_adapter.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common_footer.dart';
import 'widgets/company_carousel.dart';
import 'widgets/feature_grid.dart';
import 'widgets/statistics_carousel.dart';
import 'widgets/home_app_bar.dart';

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
          HomeAppBar(
            onNavItemTap: (index) {
              // Handle navigation item tap
              switch (index) {
                case 0:
                  LogD('Features');
                  break;
                case 1:
                  LogD('Examples');
                  break;
                case 2:
                  LogD('Resources');
                  break;
              }
            },
          ),
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
            Gaps.v32,
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
            AboutUsItem(
                topText: "Catch up on what's happening across the ecosystem",
                imagePaths: [
                  'assets/images/feature3.jpg',
                  'assets/images/feature1.jpg',
                  'assets/images/feature2.jpg',
                ],
                leftText: 'Founded in \n 2016',
                rightText: 'users \n 100k+'),
            SizedBox(height: ScreenAdapter.setHeight(40)),
            SupportItem(
                title: 'The support you need, when you need it',
                links: [
                  SupportLink(
                      title: 'Forum',
                      subtitle: 'Your Subtitle',
                      onTap: () {
                        // Action to perform when tapped
                        _launchUrl('https://example.com');
                      }),
                  SupportLink(
                      title: 'Office hours',
                      subtitle: 'Your Subtitle',
                      onTap: () {
                        // Action to perform when tapped
                        _launchUrl('https://example.com');
                      }),
                  SupportLink(
                      title: 'How to earn crypto?',
                      subtitle: 'Your Subtitle',
                      onTap: () {
                        // Action to perform when tapped
                        _launchUrl('https://example.com');
                      }),
                ]),
          ],
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
