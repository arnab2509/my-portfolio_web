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
    
    // Responsive sizing based on screen size
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;
    
    // Calculate responsive dimensions
    final cardElevation = isSmallScreen ? 2.0 : 4.0;
    final borderRadius = isSmallScreen ? 8.0 : 12.0;
    final contentPadding = isSmallScreen ? 8.0 : (isMediumScreen ? 12.0 : 16.0);
    final iconSize = isSmallScreen ? 24.0 : (isMediumScreen ? 32.0 : (isLargeScreen ? 40.0 : 36.0));
    final titleFontSize = isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : 16.0);
    final spacing = isSmallScreen ? 4.0 : 8.0;
    
    // Fixed width but no height constraint to avoid overflow
    final cardWidth = screenWidth * (isSmallScreen ? 0.85 : (isMediumScreen ? 0.4 : 0.28));
    
    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(contentPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Take minimum required space
            children: [
              Icon(
                icon,
                size: iconSize,
                color: AppTheme.primaryColor,
              ),
              SizedBox(height: spacing),
              Text(
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
              SizedBox(height: spacing),
              _buildProgressBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive sizing
    final isSmallScreen = screenWidth < 600;
    final bodyFontSize = isSmallScreen ? 9.0 : 11.0;
    final progressBarHeight = isSmallScreen ? 3.0 : 5.0;
    final smallSpacing = isSmallScreen ? 3.0 : 5.0;
    final borderRadius = isSmallScreen ? 4.0 : 6.0;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Proficiency',
              style: TextStyle(
                fontSize: bodyFontSize,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${(level * 100).toInt()}%',
              style: TextStyle(
                fontSize: bodyFontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        SizedBox(height: smallSpacing),
        Container(
          height: progressBarHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: level,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.secondaryColor,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 