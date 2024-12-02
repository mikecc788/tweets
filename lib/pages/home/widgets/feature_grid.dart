import 'package:flutter/material.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildFeatureButton(
          title: 'Ownership as you expect it',
          description:
              'Assets are stored securely offchain, meaning they are owned by you.',
          imagePath: 'assets/images/feature1.jpg',
        ),
        _buildFeatureButton(
          title: 'Familiar user experience',
          description:
              'Using Web3 will feel as easy as logging into any other social platform.',
          imagePath: 'assets/images/feature2.jpg',
        ),
        _buildFeatureButton(
          title: 'Positioned for the future',
          description:
              'Your business will be ready for the growing web3 ecosystem.',
          imagePath: 'assets/images/feature3.jpg',
        ),
        _buildFeatureButton(
          title: 'Reward your loyal creators',
          description:
              'Set offers and games built on blockchain royalty and ownership.',
          imagePath: 'assets/images/feature4.jpg',
        ),
      ],
    );
  }

  Widget _buildFeatureButton({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
