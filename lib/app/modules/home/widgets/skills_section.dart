import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/section_title.dart';
import 'package:portfolio_web/app/modules/home/widgets/skill_card.dart';
import 'package:portfolio_web/utils/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;
    
    // Determine the number of columns based on screen width
    int crossAxisCount;
    if (isSmallScreen) {
      crossAxisCount = 2;
    } else if (isMediumScreen) {
      crossAxisCount = 3;
    } else if (isLargeScreen) {
      crossAxisCount = 4; // Reduced from 5 to prevent overcrowding
    } else {
      crossAxisCount = 3; // Reduced from 4 to prevent overcrowding
    }
    
    // Calculate responsive spacing and padding
    final horizontalPadding = isSmallScreen ? 12.0 : (isMediumScreen ? 20.0 : 28.0);
    final verticalPadding = isSmallScreen ? 24.0 : 40.0;
    final gridSpacing = isSmallScreen ? 8.0 : (isMediumScreen ? 12.0 : 16.0);
    final sectionSpacing = isSmallScreen ? screenHeight * 0.015 : screenHeight * 0.025;
    
    // Further increase childAspectRatio to make cards shorter height-wise
    final childAspectRatio = isSmallScreen ? 1.2 : (isMediumScreen ? 1.3 : 1.4);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black87
          : AppTheme.primaryColor.withOpacity(0.05),
      child: Column(
        children: [
          SectionTitle(
            title: 'Skills',
            textAlign: TextAlign.center,
            fontSize: isSmallScreen ? 20.0 : (isMediumScreen ? 24.0 : 28.0),
          ),
          SizedBox(height: sectionSpacing),
          Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.profile.value.skills.isEmpty
                    ? const Center(
                        child: Text('No skills to display'),
                      )
                    : _buildSkillsGrid(
                        context: context,
                        skills: controller.profile.value.skills,
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: childAspectRatio,
                        spacing: gridSpacing,
                      ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSkillsGrid({
    required BuildContext context,
    required List<dynamic> skills,
    required int crossAxisCount,
    required double childAspectRatio,
    required double spacing,
  }) {
    // For extremely small screens or many skills, use a more compact layout
    if (MediaQuery.of(context).size.width < 350 || skills.length > 12) {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        alignment: WrapAlignment.center,
        children: skills.map((skill) => SizedBox(
          width: MediaQuery.of(context).size.width / (crossAxisCount + 0.2),
          child: SkillCard(
            name: skill.name,
            icon: _getIconData(skill.icon),
            level: skill.percentage / 100,
          ),
        )).toList(),
      );
    }
    
    // Otherwise use GridView for larger screens
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final skill = skills[index];
        return SkillCard(
          name: skill.name,
          icon: _getIconData(skill.icon),
          level: skill.percentage / 100,
        );
      },
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'flutter_dash':
        return Icons.flutter_dash;
      case 'code':
        return Icons.code;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'integration_instructions':
        return Icons.integration_instructions;
      case 'dns':
        return Icons.dns;
      case 'storage':
        return Icons.storage;
      case 'web_asset':
        return Icons.web_asset;
      case 'style':
        return Icons.style;
      case 'android':
        return Icons.android;
      case 'apple':
        return Icons.apple;
      case 'coffee':
        return Icons.coffee;
      default:
        return Icons.code;
    }
  }
} 