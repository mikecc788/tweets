import 'package:flutter/material.dart';
import '../utils/screen_adapter.dart';
import '../utils/app_colors.dart';

class CircleButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool border;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CircleButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.border = false,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.textColor,
  }) : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = widget.height ?? ScreenAdapter.setHeight(48);
    final double buttonWidth = widget.width ?? ScreenAdapter.setWidth(200);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenAdapter.setWidth(32),
          ),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF382054) : (widget.backgroundColor ?? AppColors.textPrimary),
            borderRadius: BorderRadius.circular(buttonHeight / 2),
            border:
                widget.border ? Border.all(color: AppColors.textLight, width: 1) : null,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor ?? AppColors.textLight,
                fontSize: widget.fontSize ?? ScreenAdapter.fontSize(16),
                fontWeight: widget.fontWeight ?? FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
