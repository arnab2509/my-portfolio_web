import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final VoidCallback? onTap;
  final String? logo;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    this.onTap,
    this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate responsive dimensions
    final imageHeight = isSmallScreen 
        ? screenHeight * 0.15 
        : (isMediumScreen ? screenHeight * 0.18 : screenHeight * 0.22);
    final padding = isSmallScreen ? 8.0 : (isMediumScreen ? 12.0 : 16.0);
    final titleFontSize = isSmallScreen ? 14.0 : (isMediumScreen ? 16.0 : 18.0);
    final descFontSize = isSmallScreen ? 11.0 : (isMediumScreen ? 12.0 : 14.0);
    final tagFontSize = isSmallScreen ? 9.0 : (isMediumScreen ? 10.0 : 11.0);
    final spacing = isSmallScreen ? 4.0 : (isMediumScreen ? 6.0 : 8.0);
    final logoSize = isSmallScreen ? 20.0 : (isMediumScreen ? 24.0 : 28.0);
    
    return InkWell(
      onTap: onTap,
      child: Container(
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
          mainAxisSize: MainAxisSize.min, // Take minimum vertical space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Stack(
              children: [
                Container(
                  height: imageHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (logo != null)
                  Positioned(
                    top: padding,
                    right: padding,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: EdgeInsets.all(padding / 3),
                        color: Colors.white.withOpacity(0.8),
                        child: Image.asset(
                          logo!,
                          height: logoSize,
                          width: logoSize,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Project Details - Replace Expanded with constrained container
            Container(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Take minimum vertical space
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: titleFontSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: spacing / 2),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: descFontSize,
                    ),
                    maxLines: isSmallScreen ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: spacing),
                  Wrap(
                    spacing: spacing / 2,
                    runSpacing: spacing / 2,
                    children: tags.map((tag) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding / 2,
                          vertical: padding / 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: tagFontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 