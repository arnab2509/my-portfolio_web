import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final double? fontSize;

  const SectionTitle({
    Key? key,
    required this.title,
    this.textAlign,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    
    // Use provided fontSize or default responsive size
    final textSize = fontSize ?? (isSmallScreen ? 24.0 : 32.0);
    
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center 
          ? CrossAxisAlignment.center 
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
            fontSize: textSize,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 8),
        Container(
          width: textAlign == TextAlign.center ? 100 : 80,
          height: 4,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
} 