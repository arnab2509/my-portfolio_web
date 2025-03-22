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
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Stack(
              children: [
                Container(
                  height: isSmallScreen ? 140 : (isMediumScreen ? 160 : 180),
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
                    top: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        color: Colors.white.withOpacity(0.8),
                        child: Image.asset(
                          logo!,
                          height: isSmallScreen ? 24 : 32,
                          width: isSmallScreen ? 24 : 32,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Project Details
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: isSmallScreen ? 16 : (isMediumScreen ? 18 : 20),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isSmallScreen ? 4 : 8),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                      maxLines: isSmallScreen ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: isSmallScreen ? 4 : 8,
                      runSpacing: isSmallScreen ? 4 : 8,
                      children: tags.map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 8 : 12,
                            vertical: isSmallScreen ? 2 : 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: isSmallScreen ? 10 : 12,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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