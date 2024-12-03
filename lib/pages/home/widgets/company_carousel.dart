import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/screen_adapter.dart';

class CompanyCarousel extends StatefulWidget {
  const CompanyCarousel({Key? key}) : super(key: key);

  @override
  State<CompanyCarousel> createState() => _CompanyCarouselState();
}

class _CompanyCarouselState extends State<CompanyCarousel> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> companies = [
    {'name': 'Alibaba Cloud', 'icon': 'assets/images/carousel_01.png'},
    {'name': 'Franklin Templeton', 'icon': 'assets/images/carousel_01.png'},
    {'name': 'Netmarble', 'icon': 'assets/images/carousel_01.png'},
    {'name': 'Shinami', 'icon': 'assets/images/carousel_01.png'},
    {'name': 'Bluefin', 'icon': 'assets/images/carousel_01.png'},
    {'name': 'Gree', 'icon': 'assets/images/carousel_01.png'},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });

    _scrollController.addListener(() {
      // When reaching the end, jump back to start without animation
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(0);
      }
    });
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted && _scrollController.hasClients) {
        final double maxScroll = _scrollController.position.maxScrollExtent;
        final double currentScroll = _scrollController.offset;

        // Always scroll to the end
        _scrollController
            .animateTo(
          maxScroll,
          duration: Duration(
              milliseconds: ((maxScroll - currentScroll) * 30)
                  .toInt()), // Adjust speed here
          curve: Curves.linear,
        )
            .then((_) {
          if (mounted) {
            // When animation completes, start over
            _scrollController.jumpTo(0);
            _startAutoScroll();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenAdapter.setWidth(80),
            vertical: ScreenAdapter.setHeight(20),
          ),
          child: Center(
            child: Text(
              'The most innovative companies build on Fastly',
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(24),
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: ScreenAdapter.setHeight(20)),
        SizedBox(
          height: ScreenAdapter.setHeight(80),
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: companies.length *
                3, // Triple the items for smoother infinite scroll
            padding:
                EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(80)),
            itemBuilder: (context, index) {
              final company = companies[index % companies.length];
              return Container(
                margin: EdgeInsets.only(right: ScreenAdapter.setWidth(60)),
                child: Row(
                  children: [
                    Image.asset(
                      company['icon']!,
                      height: ScreenAdapter.setHeight(40),
                      color: AppColors.textLight.withOpacity(0.8),
                    ),
                    Text(company['name']!,
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(16),
                          color: AppColors.textLight,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
