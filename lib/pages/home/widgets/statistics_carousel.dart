/// 导入必要的包
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tweets/utils/gaps.dart';
import '../../../utils/app_colors.dart';

/// 统计数据轮播组件
/// 用于展示多个统计卡片，支持左右滑动切换
/// 每个卡片包含标题、主要数值、趋势图表和两个子统计数据
class StatisticsCarousel extends StatefulWidget {
  const StatisticsCarousel({Key? key}) : super(key: key);

  @override
  State<StatisticsCarousel> createState() => _StatisticsCarouselState();
}

/// StatisticsCarousel的状态类
class _StatisticsCarouselState extends State<StatisticsCarousel>
    with SingleTickerProviderStateMixin {
  /// 页面控制器，用于管理轮播切换
  final PageController _pageController = PageController();

  /// 动画控制器，用于管理页面切换时的淡入淡出效果
  late AnimationController _animationController;

  /// 淡入淡出动画
  late Animation<double> _fadeAnimation;

  /// 当前显示的页面索引
  int _currentPage = 0;

  /// 统计数据列表
  /// 每个统计数据包含：
  /// - title: 标题
  /// - value: 主要数值
  /// - chartData: 趋势图表数据点
  /// - subStats: 子统计数据列表
  final List<Map<String, dynamic>> statistics = [
    {
      'title': 'Total Value Locked',
      'value': '\$1.63B',
      'chartData': <FlSpot>[
        FlSpot(0, 1.3),
        FlSpot(1, 1.8),
        FlSpot(2, 1.5),
        FlSpot(3, 1.7),
        FlSpot(4, 1.4),
        FlSpot(5, 2.1),
        FlSpot(6, 1.63),
      ],
      'subStats': [
        {'title': 'Total Active Accounts', 'value': '28.4M'},
        {'title': 'Total Transactions', 'value': '6.7B'},
      ]
    },
    {
      'title': 'Daily Active Users',
      'value': '425K',
      'chartData': <FlSpot>[
        FlSpot(0, 350),
        FlSpot(1, 380),
        FlSpot(2, 400),
        FlSpot(3, 375),
        FlSpot(4, 425),
        FlSpot(5, 390),
        FlSpot(6, 425),
      ],
      'subStats': [
        {'title': 'Average Session Time', 'value': '12.5m'},
        {'title': 'Retention Rate', 'value': '85%'},
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器，设置300毫秒的动画持续时间
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    // 创建从1.0到0.0的淡出动画
    _fadeAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  void dispose() {
    // 释放控制器资源
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  /// 构建圆形箭头按钮
  /// [isLeft] - 是否是左箭头
  Widget _buildArrowButton(bool isLeft) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF343A4D),
        border: Border.all(
          color: AppColors.blackOpacity10,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(
          isLeft ? Icons.arrow_back_ios_new : Icons.arrow_forward_ios,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () {
          if (isLeft && _currentPage > 0) {
            setState(() {
              _currentPage--;
            });
          } else if (!isLeft && _currentPage < statistics.length - 1) {
            setState(() {
              _currentPage++;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 80.0),
              child: _buildArrowButton(true),
            ), // 左箭头
            Column(
              children: [
                _buildStatisticCard(statistics[_currentPage], isSmallScreen),
                Row(children: [
                  _buildLineChart(
                      statistics[_currentPage]['chartData'] as List<FlSpot>),
                  Gaps.h16,
                  _buildLineChart(
                      statistics[_currentPage]['chartData'] as List<FlSpot>),
                ])
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: _buildArrowButton(false),
            ), // 右箭头
          ],
        );
      },
    );
  }

  /// 构建统计卡片
  /// [data] - 统计数据
  /// [isSmallScreen] - 是否为小屏幕设备
  Widget _buildStatisticCard(Map<String, dynamic> data, bool isSmallScreen) {
    try {
      return Container(
        width: isSmallScreen ? 300 : 600,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A).withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data['title'] ?? 'Unknown',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 20 : 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              data['value'] ?? '0',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 32 : 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: ((data['subStats'] as List?) ?? []).map<Widget>((stat) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.blackOpacity10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stat['title'] ?? '',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isSmallScreen ? 12 : 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          stat['value'] ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 16 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    } catch (e) {
      return Center(
        child: Text(
          'Error loading statistics',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }

  /// 构建折线图表
  /// [spots] - 图表数据点列表
  /// 包含渐变色的曲线和区域填充效果
  Widget _buildLineChart(List<FlSpot> spots) {
    if (spots.isEmpty) {
      return Center(child: Text('No data available'));
    }

    final minY = spots.map((e) => e.y).reduce((a, b) => a < b ? a : b) * 0.8;
    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) * 1.2;

    return Container(
      width: 292,
      height: 200,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: minY,
          maxY: maxY,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6C56F9),
                  const Color(0xFF3B29AB),
                ],
              ),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: const Color(0xFF6C56F9),
                ),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF6C56F9).withOpacity(0.3),
                    const Color(0xFF3B29AB).withOpacity(0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
