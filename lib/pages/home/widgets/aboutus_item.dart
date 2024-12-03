import 'package:flutter/material.dart';
import 'package:tweets/utils/gaps.dart';
import 'package:tweets/utils/log.dart';
import 'package:tweets/widgets/circle_button.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../utils/screen_adapter.dart';

class AboutUsItem extends StatelessWidget {
  final String topText;
  final List<String> imagePaths;
  final String leftText;
  final String rightText;

  const AboutUsItem({
    Key? key,
    required this.topText,
    required this.imagePaths,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.setHeight(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top Text
          Text(
            topText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenAdapter.setHeight(30)),
          // Swiper replacing single Image
          SizedBox(
            height: ScreenAdapter.setHeight(480),
            width: ScreenAdapter.setHeight(480),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.contain,
                    );
                  },
                  itemCount: imagePaths.length,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.white54,
                    ),
                  ),
                  autoplay: true,
                  autoplayDelay: 3000,
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenAdapter.setHeight(30)),
          // Bottom Row with Text on both sides
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  leftText,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: ScreenAdapter.setWidth(20)),
              Expanded(
                child: Text(
                  rightText,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          Gaps.v24,
          CircleButton(
              text: 'About US',
              border: true,
              backgroundColor: Colors.transparent,
              onPressed: () {
                LogD('About US');
              }),
        ],
      ),
    );
  }
}
