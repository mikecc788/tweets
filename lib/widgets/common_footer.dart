import 'package:flutter/material.dart';
import '../utils/screen_adapter.dart';
import '../utils/app_colors.dart';

class CommonFooter extends StatelessWidget {
  final Function()? onContactUs;
  final Function()? onAboutUs;
  final Function()? onPrivacyPolicy;
  final Function()? onTerms;

  const CommonFooter({
    Key? key,
    this.onContactUs,
    this.onAboutUs,
    this.onPrivacyPolicy,
    this.onTerms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF20303D),
      padding: EdgeInsets.symmetric(
        vertical: ScreenAdapter.setHeight(60),
        horizontal: ScreenAdapter.setWidth(80),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColumn(
                'Company',
                ['About Us', 'Contact Us'],
                [onAboutUs, onContactUs],
              ),
              _buildColumn(
                'Legal',
                ['Privacy Policy', 'Terms of Use'],
                [onPrivacyPolicy, onTerms],
              ),
              _buildSocialLinks(),
            ],
          ),
          SizedBox(height: ScreenAdapter.setHeight(40)),
          const Divider(color: Colors.white24),
          SizedBox(height: ScreenAdapter.setHeight(20)),
          Text(
            '© ${DateTime.now().year} Web Designer. All rights reserved.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: ScreenAdapter.fontSize(14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(String title, List<String> items, List<Function()?> onTaps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenAdapter.fontSize(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: ScreenAdapter.setHeight(20)),
        ...List.generate(
          items.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.setHeight(12)),
            child: InkWell(
              onTap: onTaps[index],
              child: Text(
                items[index],
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: ScreenAdapter.fontSize(16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenAdapter.fontSize(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: ScreenAdapter.setHeight(20)),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, () {}),
            SizedBox(width: ScreenAdapter.setWidth(20)),
            _buildSocialIcon(Icons.telegram, () {}),
            SizedBox(width: ScreenAdapter.setWidth(20)),
            _buildSocialIcon(Icons.discord, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: ScreenAdapter.setWidth(24),
        ),
      ),
    );
  }
}
