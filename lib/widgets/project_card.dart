import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final List<String> tags;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive sizing based on screen size
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;
    
    // Calculate responsive dimensions
    final cardElevation = isSmallScreen ? 4.0 : 6.0;
    final borderRadius = isSmallScreen ? 12.0 : 16.0;
    final imageHeight = isSmallScreen 
        ? screenHeight * 0.15 
        : (isMediumScreen ? screenHeight * 0.18 : screenHeight * 0.22);
    final contentPadding = isSmallScreen ? 12.0 : (isMediumScreen ? 16.0 : 20.0);
    final titleFontSize = isSmallScreen ? 16.0 : (isMediumScreen ? 18.0 : 20.0);
    final descFontSize = isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : 16.0);
    final smallSpacing = isSmallScreen ? 6.0 : 8.0;
    final mediumSpacing = isSmallScreen ? 12.0 : 16.0;
    
    // Fix potential overflow by limiting the child aspect ratio
    final cardWidth = screenWidth * (isSmallScreen ? 0.9 : (isMediumScreen ? 0.45 : 0.3));
    
    return SizedBox(
      width: cardWidth, // Control the width to help avoid overflow
      child: Card(
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Container(
                height: imageHeight,
                width: double.infinity,
                color: AppTheme.primaryColor.withOpacity(0.7),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    final iconSize = isSmallScreen ? 40.0 : (isMediumScreen ? 50.0 : 60.0);
                    return Center(
                      child: Icon(
                        Icons.app_registration,
                        size: iconSize,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Project details
            Padding(
              padding: EdgeInsets.all(contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: smallSpacing),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: descFontSize,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  SizedBox(height: mediumSpacing),
                  // Fix tag overflow by ensuring proper wrap behavior
                  Wrap(
                    spacing: smallSpacing / 2, // Reduce spacing to avoid overflow
                    runSpacing: smallSpacing / 2,
                    children: tags.map((tag) => _buildTag(context, tag)).toList(),
                  ),
                  SizedBox(height: mediumSpacing),
                  // Create a row with Wrap for button overflow
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Wrap(
                          spacing: smallSpacing,
                          runSpacing: smallSpacing / 2,
                          alignment: WrapAlignment.end,
                          children: [
                            _buildIconButton(
                              context,
                              Icons.visibility,
                              'View',
                              () {
                                // View project logic
                              },
                            ),
                            _buildIconButton(
                              context,
                              Icons.code,
                              'Code',
                              () {
                                // View source code logic
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String tag) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    
    // Make tags more compact to prevent overflow
    final horizontalPadding = isSmallScreen ? 6.0 : 8.0;
    final verticalPadding = isSmallScreen ? 2.0 : 3.0;
    final fontSize = isSmallScreen ? 9.0 : 10.0;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, 
        vertical: verticalPadding
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: fontSize,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Make buttons even more compact for extreme small screens
    final iconSize = isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : 16.0);
    final fontSize = isSmallScreen ? 8.0 : (isMediumScreen ? 9.0 : 10.0);
    final padding = isSmallScreen ? 3.0 : (isMediumScreen ? 4.0 : 5.0);
    final spacing = isSmallScreen ? 2.0 : 3.0;
    final borderRadius = isSmallScreen ? 4.0 : 6.0;
    
    return Tooltip(
      message: tooltip == 'View' ? 'View Project' : 'Source Code',
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: padding * 1.5,
            vertical: padding,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: AppTheme.primaryColor.withOpacity(0.3),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: AppTheme.primaryColor,
              ),
              SizedBox(width: spacing),
              Text(
                tooltip,
                style: TextStyle(
                  fontSize: fontSize,
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 