import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme.dart';

class SkillCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final double level;

  const SkillCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;
    
    // Calculate responsive dimensions
    final padding = isSmallScreen ? 12.0 : (isMediumScreen ? 16.0 : 20.0);
    final iconSize = isSmallScreen ? 32.0 : (isMediumScreen ? 40.0 : (isLargeScreen ? 56.0 : 48.0));
    final titleFontSize = isSmallScreen ? 14.0 : (isMediumScreen ? 16.0 : (isLargeScreen ? 20.0 : 18.0));
    final percentFontSize = isSmallScreen ? 12.0 : (isMediumScreen ? 13.0 : 14.0);
    final progressBarHeight = isSmallScreen ? 4.0 : (isMediumScreen ? 5.0 : 6.0);
    
    // Calculate spacing based on screen height
    final verticalSpacing = isSmallScreen 
        ? screenHeight * 0.01 
        : (isMediumScreen ? screenHeight * 0.015 : screenHeight * 0.02);
    
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: AppTheme.primaryColor,
          ),
          SizedBox(height: verticalSpacing),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: verticalSpacing),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
            minHeight: progressBarHeight,
            borderRadius: BorderRadius.circular(progressBarHeight),
          ),
          SizedBox(height: verticalSpacing * 0.5),
          Text(
            '${(level * 100).toInt()}%',
            style: TextStyle(
              fontSize: percentFontSize,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
} 