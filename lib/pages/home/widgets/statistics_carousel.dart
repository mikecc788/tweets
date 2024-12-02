/// 导入必要的包
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return Container(
          height: isSmallScreen ? 450 : 380,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                  _animationController.forward().then((_) {
                    _animationController.reverse();
                  });
                },
                itemCount: statistics.length,
                itemBuilder: (context, index) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildStatisticCard(
                      statistics[index],
                      isSmallScreen,
                    ),
                  );
                },
              ),
              if (statistics.length > 1) ...[
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: _buildNavigationButton(true),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _buildNavigationButton(false),
                ),
              ],
            ],
          ),
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
        width: MediaQuery.of(context).size.width * (isSmallScreen ? 0.9 : 0.3),
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'] ?? 'Unknown',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 16 : 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              data['value'] ?? '0',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 28 : 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _buildLineChart(data['chartData'] as List<FlSpot>),
            ),
            SizedBox(height: 20),
            Row(
              children: ((data['subStats'] as List?) ?? []).map<Widget>((stat) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stat['title'] ?? '',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isSmallScreen ? 10 : 12,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          stat['value'] ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 14 : 16,
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

    return LineChart(
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
                Colors.purple.withAlpha((0.8 * 255).toInt()),
                Colors.blue.withAlpha((0.8 * 255).toInt()),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 3,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: Colors.purple,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.purple.withAlpha((0.3 * 255).toInt()),
                  Colors.blue.withAlpha((0.05 * 255).toInt()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建导航按钮
  /// [isLeft] - 是否为左侧按钮
  /// 包含渐变背景和点击处理逻辑
  Widget _buildNavigationButton(bool isLeft) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withAlpha((0.5 * 255).toInt()),
            Colors.transparent,
          ],
          begin: isLeft ? Alignment.centerLeft : Alignment.centerRight,
          end: isLeft ? Alignment.centerRight : Alignment.centerLeft,
        ),
      ),
      child: IconButton(
        icon: Icon(
          isLeft ? Icons.chevron_left : Icons.chevron_right,
          color: Colors.white,
        ),
        onPressed: () {
          if (isLeft && _currentPage > 0) {
            _pageController.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else if (!isLeft && _currentPage < statistics.length - 1) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    );
  }
}
