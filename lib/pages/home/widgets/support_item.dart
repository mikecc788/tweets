import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/gaps.dart';

class SupportItem extends StatelessWidget {
  final String title;
  final List<SupportLink> links;

  const SupportItem({
    Key? key,
    required this.title,
    required this.links,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧大文本
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          Gaps.h32,
          // 右侧列表
          Expanded(
            flex: 3,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: links.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.white.withOpacity(0.1),
                height: 32,
              ),
              itemBuilder: (context, index) {
                return _LinkItem(link: links[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SupportLink {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportLink({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class _LinkItem extends StatefulWidget {
  final SupportLink link;

  const _LinkItem({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  State<_LinkItem> createState() => _LinkItemState();
}

class _LinkItemState extends State<_LinkItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.link.onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.link.title,
                      style: TextStyle(
                        color:
                            isHovered ? const Color(0xFF6C56F9) : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v8,
                    Text(
                      widget.link.subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: isHovered
                    ? const Color(0xFF6C56F9)
                    : Colors.white.withOpacity(0.6),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
