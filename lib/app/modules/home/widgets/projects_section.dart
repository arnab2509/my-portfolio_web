import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/data/models/project_model.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/project_card.dart';
import 'package:portfolio_web/app/modules/home/widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive values
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Determine the number of columns based on screen width
    int crossAxisCount = 3;
    double aspectRatio = 0.8;
    
    if (isSmallScreen) {
      crossAxisCount = 1;
      aspectRatio = 0.9;
    } else if (isMediumScreen) {
      crossAxisCount = 2;
      aspectRatio = 0.85;
    }
    
    // Calculate responsive padding and spacing
    final horizontalPadding = isSmallScreen ? 12.0 : (isMediumScreen ? 20.0 : 28.0);
    final verticalPadding = isSmallScreen ? 16.0 : 24.0;
    final itemSpacing = isSmallScreen ? 12.0 : 16.0;
    final sectionTitleSize = isSmallScreen ? 18.0 : (isMediumScreen ? 22.0 : 26.0);
    final titleSpacing = isSmallScreen ? 16.0 : 20.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      // Add margin to create space between sections
      margin: EdgeInsets.only(
        top: verticalPadding,
        bottom: verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Take minimum vertical space
        children: [
          SectionTitle(
            title: 'Projects',
            fontSize: sectionTitleSize,
          ),
          SizedBox(height: titleSpacing),
          Obx(
            () => controller.profile.value.projects.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _buildProjectsGrid(
                    context: context,
                    projects: controller.profile.value.projects,
                    crossAxisCount: crossAxisCount,
                    aspectRatio: aspectRatio,
                    spacing: itemSpacing,
                    controller: controller,
                  ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildProjectsGrid({
    required BuildContext context,
    required List<ProjectModel> projects,
    required int crossAxisCount,
    required double aspectRatio,
    required double spacing,
    required HomeController controller,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    
    // Calculate the expected height of each project card
    final double estimatedItemHeight = isSmallScreen ? 300.0 : 350.0;
    
    // Calculate how many rows we'll need
    final int rowCount = (projects.length / crossAxisCount).ceil();
    
    // Calculate the total height needed
    final double totalGridHeight = (estimatedItemHeight * rowCount) + (spacing * (rowCount - 1));
    
    return SizedBox(
      height: totalGridHeight,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: aspectRatio,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final ProjectModel project = projects[index];
          return ProjectCard(
            title: project.title,
            description: project.description,
            image: project.image,
            tags: project.technologies,
            logo: project.logo,
            onTap: () {
              // Handle project tap
              // May open a detail page or launch a URL
              if (project.url != null) {
                controller.launchURL(project.url!);
              }
            },
          );
        },
      ),
    );
  }
} 